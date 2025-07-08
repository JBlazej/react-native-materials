import {ViewProps} from 'react-native'

export type Material = 'ultra-thin' | 'thin' | 'regular' | 'thick' | 'ultra-thick'

export type MaterialViewProps = {
  material: Material
} & ViewProps
