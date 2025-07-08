import {requireNativeView} from 'expo'
import * as React from 'react'
import {useColorScheme} from 'react-native'

import {MaterialViewProps} from './Material.types'

const NativeView: React.ComponentType<MaterialViewProps> = requireNativeView('Materials')

export default function MaterialView({variant, ...props}: MaterialViewProps) {
  const colorScheme = useColorScheme()

  const colorSchemeVariant = React.useMemo(
    () => (variant ? variant : (colorScheme ?? undefined)),
    [colorScheme, variant]
  )

  return <NativeView {...props} variant={colorSchemeVariant} />
}
