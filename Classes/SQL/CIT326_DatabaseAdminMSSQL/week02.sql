SELECT	sys.objects.name
FROM	sys.objects inner join sys.columns
ON		sys.objects.object_id = sys.columns.object_id
WHERE	sys.objects.type = 'U'
AND		sys.columns.name = 'project_no';