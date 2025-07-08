import {ViewProps} from 'react-native'

export type MaterialStyle = 'ultrathin' | 'thin' | 'regular' | 'thick' | 'ultrathick'

export type MaterialsViewProps = {
  materialStyle: MaterialStyle
} & ViewProps
