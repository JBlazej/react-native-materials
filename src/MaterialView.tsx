import {MaterialViewProps} from './Material.types'

export default function MaterialView(_: MaterialViewProps) {
  console.error(
    'MaterialView is not implemented for this platform. Please use the native implementation for Android or iOS.'
  )

  return null
}
