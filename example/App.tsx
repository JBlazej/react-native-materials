import {Material, MaterialsView} from '@jan/react-native-materials'
import {LinearGradient} from 'expo-linear-gradient'
import {useEffect, useState} from 'react'
import {Appearance, ColorSchemeName, SafeAreaView, ScrollView, StyleSheet, Switch, Text, View} from 'react-native'

const materials: Material[] = ['ultrathin', 'thin', 'regular', 'thick', 'ultrathick']

export default function App() {
  const [colorScheme, setColorScheme] = useState<ColorSchemeName>('light')

  useEffect(() => {
    Appearance.setColorScheme(colorScheme)
  }, [colorScheme])

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.container}>
        <View style={styles.switch}>
          <Switch value={colorScheme === 'dark'} onValueChange={value => setColorScheme(value ? 'dark' : 'light')} />
        </View>
        {materials.map(material => (
          <View key={material} style={styles.card}>
            <View style={StyleSheet.absoluteFill}>
              <MaterialsView material={material} style={{flex: 1}} />
            </View>
            <Text style={{color: colorScheme === 'dark' ? 'white' : 'black'}}>Material {material}</Text>
          </View>
        ))}
      </ScrollView>
      <LinearGradient
        colors={['red', 'yellow']}
        start={{x: 0.5, y: 0}}
        end={{x: 1, y: 1}}
        style={[StyleSheet.absoluteFill, {zIndex: 1}]}
      />
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  card: {
    alignItems: 'center',
    borderRadius: 22,
    height: 66,
    justifyContent: 'center',
    marginTop: 12,
    overflow: 'hidden',
  },
  container: {
    flex: 1,
    paddingHorizontal: 32,
    paddingTop: 120,
    zIndex: 10,
  },
  switch: {
    alignItems: 'center',
    flexDirection: 'row',
    gap: 16,
  },
})
