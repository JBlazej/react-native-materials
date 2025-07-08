import {MaterialsView} from '@jan/react-native-materials'
import {SafeAreaView, ScrollView, StyleSheet, Text, View} from 'react-native'

export default function App() {
  return (
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.container}>
        <View style={{height: 100, width: '100%'}}>
          <Text>Module API Example</Text>
          <View style={StyleSheet.absoluteFill}>
            <MaterialsView materialStyle="light" />
          </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  )
}

const styles = {
  container: {
    backgroundColor: 'red',
    flex: 1,
    paddingHorizontal: 32,
    paddingTop: 120,
  },
}
