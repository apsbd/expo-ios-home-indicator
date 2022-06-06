import React, { useEffect } from "react";
import { Platform } from "react-native";
import { NativeModulesProxy } from 'expo-modules-core';

const { ExpoIosHomeIndicator } = NativeModulesProxy;
const isIos = Platform.OS === "ios";

type Props = { autoHidden: boolean };

export const IosHomeIndicator = (props: Props) => {
    useEffect(() => {
        if (!isIos) return;

        propsHistory.push(props);
        updateNativeHomeIndicator({ autoHidden: props.autoHidden });

        return () => {
            if (!isIos) return;

            const previousProps = popAndGetPreviousProps();
            updateNativeHomeIndicator({ autoHidden: previousProps.autoHidden });
        };
    }, []);

    return null;
};

let propsHistory: Props[] = [];

export function clearPropsHistory() {
    propsHistory = [];
}

export function getPropsHistory() {
    return [...propsHistory];
}

export function popAndGetPreviousProps() {
    propsHistory.pop();
    return propsHistory[propsHistory.length - 1] || { autoHidden: false };
}

async function updateNativeHomeIndicator({ autoHidden = false }: { autoHidden: boolean }) {
    if (autoHidden) {
        await ExpoIosHomeIndicator.setAutoHiddenAsync(autoHidden);
    }
}
