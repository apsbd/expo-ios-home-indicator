import {
    NativeModulesProxy,
    requireNativeViewManager
} from 'expo-modules-core';
import React from 'react';
import { View, StyleSheet, findNodeHandle } from 'react-native';

import { ExpoIosHomeIndicatorViewProps } from './ExpoIosHomeIndicatorView.types';

type ExpoIosHomeIndicatorViewForwardedRefProp = {
    forwardedRef: React.ForwardedRef<View>;
};

class ExpoIosHomeIndicatorView extends React.Component<
    ExpoIosHomeIndicatorViewProps & ExpoIosHomeIndicatorViewForwardedRefProp
> {
    private homeIndicatorViewRef = React.createRef<View>();

    private onRefChange = (view: View | null) => {
        if (!view) {
            return;
        }

        const originalSetNativeProps = view.setNativeProps.bind(view);

        view.setNativeProps = ({
            autoHidden,
            ...nativeProps
        }: ExpoIosHomeIndicatorViewProps) => {
            view && originalSetNativeProps(nativeProps);

            this.homeIndicatorViewRef.current &&
                NativeModulesProxy.ExpoIosHomeIndicatorViewManager.setNativeProps(
                    { autoHidden },
                    findNodeHandle(this.homeIndicatorViewRef.current)
                );
        };

        // mimic `forwardedRef` logic
        if (typeof this.props.forwardedRef === 'function') {
            this.props.forwardedRef(view);
        } else if (this.props.forwardedRef) {
            this.props.forwardedRef.current = view;
        }
    };

    render() {
        const {
            autoHidden = true,
            style,
            children,
            forwardedRef,
            ...props
        } = this.props;
        return (
            <View
                {...props}
                ref={this.onRefChange}
                style={[styles.container, style]}>
                <NativeHomeIndicatorView
                    ref={this.homeIndicatorViewRef}
                    autoHidden={autoHidden}
                    style={StyleSheet.absoluteFill}
                />
                {children}
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: { backgroundColor: 'transparent' }
});

const NativeHomeIndicatorView = requireNativeViewManager(
    'ExpoIosHomeIndicatorView'
);

const ExpoIosHomeIndicatorViewWithForwardedRef = React.forwardRef<
    View,
    ExpoIosHomeIndicatorViewProps
>((props, forwardRef) => (
    <ExpoIosHomeIndicatorView {...props} forwardedRef={forwardRef} />
));

export default ExpoIosHomeIndicatorViewWithForwardedRef;
