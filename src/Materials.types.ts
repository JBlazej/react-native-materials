import {ViewProps} from 'react-native'

export type Material = 'ultrathin' | 'thin' | 'regular' | 'thick' | 'ultrathick'

export type MaterialsViewProps = {
  material: Material
} & ViewProps
