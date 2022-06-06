import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';

export type ExpoIosHomeIndicatorViewProps = {
    autoHidden: boolean;
};

type ExpoIosHomeIndicatorViewState = {};

const NativeView: React.ComponentType<ExpoIosHomeIndicatorViewProps> =
    requireNativeViewManager('ExpoIosHomeIndicator');

export default class ExpoIosHomeIndicatorView extends React.Component<
    ExpoIosHomeIndicatorViewProps,
    ExpoIosHomeIndicatorViewState
> {
    render() {
        return <NativeView autoHidden={this.props.autoHidden} />;
    }
}
