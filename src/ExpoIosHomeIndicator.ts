import { NativeModulesProxy } from 'expo-modules-core';

import ExpoIosHomeIndicatorView, { ExpoIosHomeIndicatorViewProps } from './ExpoIosHomeIndicatorView'

const { ExpoIosHomeIndicator } = NativeModulesProxy;

export async function helloAsync(options: Record<string, string>) {
  return await ExpoIosHomeIndicator.helloAsync(options);
}

export {
  ExpoIosHomeIndicatorView,
  ExpoIosHomeIndicatorViewProps
};
