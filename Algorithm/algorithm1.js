// 조합 구하기 함수
function getCombinations(array, num) {
	const result = []
	if (num === 1) return array.map((value) => [value])

	array.forEach((fixed, index, origin) => {
		const rest = origin.slice(index + 1)
		const combinations = getCombinations(rest, num - 1)
		const attached = combinations.map((combination) => [fixed, ...combination])
		result.push(...attached)
	})

	return result
}

function solution(orders, courses) {
	const results = []
	let obj = {}

	orders = orders.map((order) => order.split('').sort().join(''))

	for (const order of orders) {
		let data = []
		let arr = order.split('')

		for (const course of courses) {
			data.push(...getCombinations(arr, course))
		}

		obj = data.reduce((acc, el) => {
			let joined = el.join('')

			if (joined in acc) {
				acc[joined] += 1
			} else {
				acc[joined] = 1
			}
			return acc
		}, obj)
	}
	let arr = Object.entries(obj)

	for (const course of courses) {
		let arr2 = arr.filter((el) => el[0].length === course && el[1] > 1)
		let max = 0

		if (arr2.length > 0) {
			max = Math.max(...arr2.map((el) => el[1]))
		}
		arr2.forEach((el) => {
			if (el[1] === max) {
				results.push(el[0])
			}
		})
	}

	return results.sort()
}

let orders = ['ABCFG', 'AC', 'CDE', 'ACDE', 'BCFG', 'ACDEH']
let courses = [2, 3, 4]

let result = solution(orders, courses)
console.log('1번 케이스 ::::::::::::')
console.log(result)

orders = ['ABCDE', 'AB', 'CD', 'ADE', 'XYZ', 'XYZ', 'ACD']
courses = [2, 3, 5]

result = solution(orders, courses)
console.log('2번 케이스 :::::::::::::')
console.log(result)

orders = ['XYZ', 'XWY', 'WXA']
courses = [2, 3, 4]

result = solution(orders, courses)
console.log('3번 케이스 :::::::::::::')
console.log(result)
