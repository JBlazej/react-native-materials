import {requireNativeView} from 'expo'
import * as React from 'react'

import {MaterialViewProps} from './Material.types'

const NativeView: React.ComponentType<MaterialViewProps> = requireNativeView('Materials')

export default function MaterialView(props: MaterialViewProps) {
  return <NativeView {...props} />
}
