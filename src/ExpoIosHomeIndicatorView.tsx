import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';
import { ExpoIosHomeIndicatorViewProps } from './ExpoIosHomeIndicatorView.types';

type ExpoIosHomeIndicatorViewState = {};

const NativeView: React.ComponentType<ExpoIosHomeIndicatorViewProps> =
    requireNativeViewManager('ExpoIosHomeIndicator');

export default class ExpoIosHomeIndicatorView extends React.Component<
    ExpoIosHomeIndicatorViewProps,
    ExpoIosHomeIndicatorViewState
> {
    render() {
        return <NativeView name={this.props.name} />;
    }
}
