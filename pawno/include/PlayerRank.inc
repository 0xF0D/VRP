	new rtext[30];
	switch(member)
	{
	case 0: rtext = "Нет";
	case 5:
		{
			switch(rank)
			{
			case 1: rtext = "Новицио";
			case 2: rtext = "Ассосиато";
			case 3: rtext = "Сомбаттенте";
			case 4: rtext = "Солдато";
			case 5: rtext = "Боец";
			case 6: rtext = "Сотто-Капо";
			case 7: rtext = "Капо";
			case 8: rtext = "Младший босс";
			case 9: rtext = "Консильери";
			case 10: rtext = "Дон";
			default: rtext = "Новицио";
			}
		}
	case 7:
		{
			switch(rank)
			{
			case 1: rtext = "Секретарь";
			case 2: rtext = "Адвокат";
			case 3: rtext = "Охрана";
			case 4: rtext = "Нач.Охраны";
			case 5: rtext = "Зам.Мэра";
			case 6: rtext = "Мэр";
			default: rtext = "Секретарь";
			}
		}
	case 1, 10, 21:
		{
			switch(rank)
			{
			case 1: rtext = "Кадет";
			case 2: rtext = "Офицер";
			case 3: rtext = "Мл.Сержант";
			case 4: rtext = "Сержант";
			case 5: rtext = "Ст.Сержант";
			case 6: rtext = "Прапорщик";
			case 7: rtext = "Ст.Прапорщик";
			case 8: rtext = "Мл.Лейтенант";
			case 9: rtext = "Лейтенант";
			case 10: rtext = "Ст.Лейтенант";
			case 11: rtext = "Капитан";
			case 12: rtext = "Майор";
			case 13: rtext = "Подполковник";
			case 14: rtext = "Полковник";
			case 15: rtext = "Шериф";
			default: rtext = "Кадет";
			}
		}
	case 2:
		{
			switch(rank)
			{
			case 1: rtext = "Стажёр";
			case 2: rtext = "Дежурный";
			case 3: rtext = "Мл.Агент";
			case 4: rtext = "Мл.Агент CID";
			case 5: rtext = "Мл.Агент OOP";
			case 6: rtext = "Мл.Агент GNK";
			case 7: rtext = "Агент CID";
			case 8: rtext = "Агент OOP";
			case 9: rtext = "Агент GNK";
			case 10: rtext = "Ст.Агент CID";
			case 11: rtext = "Ст.Агент OOP";
			case 12: rtext = "Ст.Агент GNK";
			case 13: rtext = "Глава CID";
			case 14: rtext = "Глава OOP";
			case 15: rtext = "Глава GNK";
			case 16: rtext = "Бесклассовый агент";
			case 17: rtext = "Агент 1-ого Класса";
			case 18: rtext = "Агент 2-ого Класса";
			case 19: rtext = "Инспектор FBI";
			case 20: rtext = "Ст.Инспектор FBI";
			case 21: rtext = "Зам.Директора FBI";
			case 22: rtext = "Директор FBI";
			default: rtext = "Стажёр";
			}
		}
	case 3, 19:
		{
			switch(rank)
			{
			case 1: rtext = "Рядовой";
			case 2: rtext = "Ефрейтор";
			case 3: rtext = "Мл.Сержант";
			case 4: rtext = "Сержант";
			case 5: rtext = "Ст.Сержант";
			case 6: rtext = "Старшина";
			case 7: rtext = "Прапорщик";
			case 8: rtext = "Мл.Лейтенант";
			case 9: rtext = "Лейтенант";
			case 10: rtext = "Ст.Лейтенант";
			case 11: rtext = "Капитан";
			case 12: rtext = "Майор";
			case 13: rtext = "Подполковник";
			case 14: rtext = "Полковник";
			case 15: rtext = "Генерал";
			default: rtext = "Рядовой";
			}
		}
	case 22, 4:
		{
			switch(rank)
			{
			case 1: rtext = "Интерн";
			case 2: rtext = "Санитар";
			case 3: rtext = "Мед. Брат";
			case 4: rtext = "Спасатель";
			case 5: rtext = "Нарколог";
			case 6: rtext = "Доктор";
			case 7: rtext = "Психолог";
			case 8: rtext = "Хирург";
			case 9: rtext = "Зам.Глав.Врача";
			case 10: rtext = "Глав.Врач";
			default: rtext = "Интерн";
			}
		}
	case 8:
		{
			switch(rank)
			{
			case 1: rtext = "Чипер";
			case 2: rtext = "Охрана";
			case 3: rtext = "Крупье";
			case 4: rtext = "Зам.Директора";
			case 5: rtext = "Директор";
			default: rtext = "Чипер";
			}
		}
	case 6:
		{
			switch(rank)
			{
			case 1: rtext = "Вакасю";
			case 2: rtext = "Сятэй";
			case 3: rtext = "Кёдай";
			case 4: rtext = "Фуку-Хомбуте";
			case 5: rtext = "Вакагасира";
			case 6: rtext = "Со-Хонбуте";
			case 7: rtext = "Камбу";
			case 8: rtext = "Сайко Комон";
			case 9: rtext = "Оядзи";
			case 10: rtext = "Кумите";
			default: rtext = "Вакасю";
			}
		}
	case 14:
		{
			switch(rank)
			{
			case 1: rtext = "Шнырь";
			case 2: rtext = "Фраер";
			case 3: rtext = "Бык";
			case 4: rtext = "Барыга";
			case 5: rtext = "Блатной";
			case 6: rtext = "Свояк";
			case 7: rtext = "Браток";
			case 8: rtext = "Вор";
			case 9: rtext = "Вор в законе";
			case 10: rtext = "Авторитет";
			default: rtext = "Шнырь";
			}
		}
	case 15:
		{
			switch(rank)
			{
			case 1: rtext = "Плэйя";
			case 2: rtext = "Хастла";
			case 3: rtext = "Килла";
			case 4: rtext = "Юонг Г";
			case 5: rtext = "Гангста";
			case 6: rtext = "О.Г";
			case 7: rtext = "Мобста";
			case 8: rtext = "Де Кинг";
			case 9: rtext = "Легенд";
			case 10: rtext = "Мэд Дог";
			default: rtext = "Плэйя";
			}
		}
	case 17:
		{
			switch(rank)
			{
			case 1: rtext = "Перро";
			case 2: rtext = "Тирадор";
			case 3: rtext = "Геттор";
			case 4: rtext = "Лас Геррас";
			case 5: rtext = "Мирандо";
			case 6: rtext = "Сабио";
			case 7: rtext = "Инвасор";
			case 8: rtext = "Тесореро";
			case 9: rtext = "Нестро";
			case 10: rtext = "Падре";
			default: rtext = "Перро";
			}
		}
	case 12:
		{
			switch(rank)
			{
			case 1: rtext = "Блайд";
			case 2: rtext = "Бастер";
			case 3: rtext = "Крэкер";
			case 4: rtext = "Гун бро";
			case 5: rtext = "Ап Бро";
			case 6: rtext = "Гангстер";
			case 7: rtext = "Федерал Блок";
			case 8: rtext = "Фолкс";
			case 9: rtext = "Райч Нигга";
			case 10: rtext = "Биг вилли";
			default: rtext = "Блайд";
			}
		}
	case 18:
		{
			switch(rank)
			{
			case 1: rtext = "Ладрон";
			case 2: rtext = "Новато";
			case 3: rtext = "Амиго";
			case 4: rtext = "Мачо";
			case 5: rtext = "Джуниор";
			case 6: rtext = "Эрмано";
			case 7: rtext = "Бандидо";
			case 8: rtext = "Ауторидад";
			case 9: rtext = "Аджунто";
			case 10: rtext = "Падре";
			default: rtext = "Ладрон";
			}
		}
	case 13:
		{
			switch(rank)
			{
			case 1: rtext = "Новато";
			case 2: rtext = "Ординарио";
			case 3: rtext = "Локал";
			case 4: rtext = "Верификадо";
			case 5: rtext = "Бандито";
			case 6: rtext = "V.E.G";
			case 7: rtext = "Ассесино";
			case 8: rtext = "Лидер V.E.G";
			case 9: rtext = "Падрино";
			case 10: rtext = "Падре";
			default: rtext = "Новато";
			}
		}
	case 16:
		{
			switch(rank)
			{
			case 1: rtext = "Практикантёр";
			case 2: rtext = "Стажер";
			case 3: rtext = "Программист";
			case 4: rtext = "Ведущий";
			case 5: rtext = "Папарацции";
			case 6: rtext = "Репортёр";
			case 7: rtext = "Новости";
			case 8: rtext = "Фотограф";
			case 9: rtext = "Журналист";
			case 10: rtext = "Редактор";
			case 11: rtext = "Главный редактор";
			case 12: rtext = "Заместитель директора";
			case 13: rtext = "Директор";
			default: rtext = "Практикантёр";
			}
		}
	case 11:
		{
			switch(rank)
			{
			case 1: rtext = "Стажер";
			case 2: rtext = "Консультант";
			case 3: rtext = "Экзаменатор";
			case 4: rtext = "Младший Инструктор";
			case 5: rtext = "Инструктор";
			case 6: rtext = "Координатор";
			case 7: rtext = "Младший Менеджер";
			case 8: rtext = "Старший Менеджер";
			case 9: rtext = "Директор";
			case 10: rtext = "Управляющий";
			default: rtext = "Стажёр";
			}
		}
	case 25:
		{
			switch(rank)
			{
			case 1: rtext = "Прапорщик";
			case 2: rtext = "Ст.Прапорщик";
			case 3: rtext = "Мл.Лейтенант";
			case 4: rtext = "Лейтенант";
			case 5: rtext = "Ст.Лейтенант";
			case 6: rtext = "Капитан";
			case 7: rtext = "Майор";
			case 8: rtext = "Подполковник";
			case 9: rtext = "Полковник";
			case 10: rtext = "Нач.подразделения SWAT";
			default: rtext = "Прапорщик";
			}
		}
	case 23:
		{
			switch(rank)
			{
			case 12: rtext = "Директор";
			case 11: rtext = "Зам.директора";
			case 10: rtext = "Профессионал";
			case 9: rtext = "Тестер";
			case 8: rtext = "Серийный убийца";
			case 7: rtext = "Убийца-одиночка";
			case 6: rtext = "Тихий убийца";
			case 5: rtext = "Спец.агент";
			case 4: rtext = "Агент";
			case 3: rtext = "Киллер";
			case 2: rtext = "Мясник";
			case 1: rtext = "Ученик";
			default: rtext = "Ученик";
			}
		}
	case 24:
		{
			switch(rank)
			{
			case 10: rtext = "Король улиц";
			case 9: rtext = "Король дрифта";
			case 8: rtext = "Король драга";
			case 7: rtext = "Тренер";
			case 6: rtext = "Профессионал";
			case 5: rtext = "Опытный Стритрейсер";
			case 4: rtext = "Стритрейсер";
			case 3: rtext = "Водила";
			case 2: rtext = "Новичок";
			case 1: rtext = "Изгой";
			default: rtext = "Изгой";
			}
		}
	case 26:
		{
			switch(rank)
			{
			case 1: rtext = "Охраник";
			case 2: rtext = "Начальник Охраны";
			case 3: rtext = "Пресс-секретарь";
			case 4: rtext = "Министр Здравохранения";
			case 5: rtext = "Министр МВД";
			case 6: rtext = "Министр обороны";
			case 7: rtext = "Верховный судья";
			case 8: rtext = "Премьер-министр";
			case 9: rtext = "Вице-Президент";
			case 10: rtext = "Президент Штата";
			default: rtext = "Охраник Президента";
			}
		}
	case 27:
		{
			switch(rank)
			{
			case 1: rtext = "Матрос";
			case 2: rtext = "Ст.Матрос";
			case 3: rtext = "Мичман";
			case 4: rtext = "Cт.Мичман";
			case 5: rtext = "Лейтенант";
			case 6: rtext = "Капитан-Лейтенант";
			case 7: rtext = "Капитан 3 ранга";
			case 8: rtext = "Капитан 2 ранга";
			case 9: rtext = "Капитан 1 ранга";
			case 10: rtext = "Вице-Адмирал";
			case 11: rtext = "Адмирал";
			default: rtext = "Матрос";
			}
		}
	case 28:
		{
			switch(rank)
			{
			case 1: rtext = "Support";
			case 2: rtext = "Hang around";
			case 3: rtext = "Prospect";
			case 4: rtext = "Member";
			case 5: rtext = "Road captain";
			case 6: rtext = "Sergeant-at-arms";
			case 7: rtext = "Treasurer";
			case 8: rtext = "Hunter";
			case 9: rtext = "Road Hunter";
			case 10: rtext = "Вице президент";
			case 11: rtext = "Президент";
			default: rtext = "";
			}
		}
	default: rtext = "Нет";
	}
	return rtext;