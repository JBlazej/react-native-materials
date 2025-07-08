import {ViewProps} from 'react-native'

export type Material = 'ultra-thin' | 'thin' | 'regular' | 'thick' | 'ultra-thick'
export type MaterialStyle = 'light' | 'dark'

export type MaterialViewProps = {
  material: Material
  variant?: MaterialStyle
} & ViewProps
