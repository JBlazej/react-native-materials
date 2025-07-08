import {requireNativeView} from 'expo'
import * as React from 'react'

import {MaterialsViewProps} from './Materials.types'

const NativeView: React.ComponentType<MaterialsViewProps> = requireNativeView('Materials')

export default function MaterialsView(props: MaterialsViewProps) {
  return <NativeView {...props} />
}
