Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF7C1B86EC
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2024 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721422542; cv=none; b=PQzDi6wTETirp1GN8nA9iTSOTA2TLVKQu+Cp52wnZmYedxjYUtf8Ve6KjXH4/E5qH7thOf6llsB3zPrNTf5Cy6dTgdwQ/nM0S3lBwh6QCLHSIzy9bJx/+fT1B2eYGNOkBH0gU/4Ggk6kgyLYZlnxloVmQwHuieYCjP+IU3d8kbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721422542; c=relaxed/simple;
	bh=l4Ks79YNqVuDnAuwwKFJ37XY9BsGwX9fbRIOJCDX4VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZUMlMgYZp5bLuFj35i9ToSRc7MoqveopRPu7aoRdF0Qb3lDXXcKJJAULQbzOIBqx25AvM20tpPUW6I68wpMKDuo5CKP1PjsCr/AgKwFCEW7pV8KqlJfXWMVFvJFUeEN5do5mD/LQ8ISQGDC5f3RiaXM5y37fRgfKMSI8jfNb1PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DCmxv20C; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCmxv20C"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7037a208ff5so1320221a34.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2024 13:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721422540; x=1722027340; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zrl1Y6YawrpQTcJf/fQ2r4sSawu4iSfJJ2SWKoJA670=;
        b=DCmxv20CYYBs+dryucVcc4E9BxjHzfTWZ/iRs2NbiwXJK4OWOUTJqIpGjHVSyGykyD
         ffhydtLT/qwK8NmJO2wBhvZXtsW2qNGcxEJy9IKAIHOonPQU3yaYC5WN4zG0PrhK960Y
         k6Yfm+jGXaSBYo3VAIvfkZCYYEAkSyzGttwXnpsspCslX5aHykrI0kipcBYdIjl2QO5u
         sv6AB1AB5tmQIQlUsT3VUppZluU+yokHTRdbrSVeBFgLZByiSke+gT2kzpjwLp28k7sH
         RXjZkqHeBp4c7jVzszsRMkAPwMc65/fXZjkrVgDeeu/qJez5JJMnRV2zltHxc1ofk3xY
         04bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721422540; x=1722027340;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zrl1Y6YawrpQTcJf/fQ2r4sSawu4iSfJJ2SWKoJA670=;
        b=hLyCcYiR78ObqCjKzwEoqyfeiSs8aspBquba+FH5EPsuv/2IheYl0JpyU+jc8YbuHM
         Uxk38nnsyodaUUZ1GmposWAQK0zJgzlL8bbBYaZEAZTO6gPuMG6QsUXkmEW3B1zgcNDV
         s/qr/lhvq5774njBSsZzHMwdPlACBWwoYIR/kd4cP1xQiLz30Gjh1gW/QkBT7SGgXMB9
         ovPG3d59u5inG9vrZIeaYhkX3cSOo+GzJQzwGS1W7dr2njEs0caG/jlZCKNPCZQ9GHCI
         pxxQdGuk3yFpkrIYlSLrnGoasEQlFDiy66auclfljEMAVTDu/KgvIjglgxBKd4Tb2kyp
         B/vQ==
X-Gm-Message-State: AOJu0YyC4hmDdziCZg22+eek5lUzI6ZmnwcB+QS6fC0JxnFwCaz9sVDc
	7WMm9dm4rrJs4RJDuynk/AxyneHAmc/twZJSIC6hUws0bOLPZufTXDnxLlrssCywTy2EibvKjeB
	+
X-Google-Smtp-Source: AGHT+IE3frboOhuC6uI31KDuhMXAWMgIaMSnLt/ToXuwNIHREMmekQrTMyom+XbYH9G3yWIaRwF+5Q==
X-Received: by 2002:a05:6830:3894:b0:704:4a3f:8d75 with SMTP id 46e09a7af769-708fdadf534mr1333541a34.5.1721422540140;
        Fri, 19 Jul 2024 13:55:40 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:739a:b665:7f57:d340])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f60ec231sm456528a34.45.2024.07.19.13.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 13:55:39 -0700 (PDT)
Date: Fri, 19 Jul 2024 15:55:37 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eduardo Valentin <eduval@amazon.com>
Cc: linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE
Message-ID: <abd89e07-3a61-408e-ac2c-67ec0605f12b@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Eduardo Valentin,

Commit 3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for
PSC_TEMPERATURE") from Apr 28, 2022 (linux-next), leads to the
following Smatch static checker warning:

	drivers/hwmon/pmbus/pmbus_core.c:1375 pmbus_add_sensor()
	error: we previously assumed 'type' could be null (see line 1347)

drivers/hwmon/pmbus/pmbus_core.c
    1331 static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
    1332                                              const char *name, const char *type,
    1333                                              int seq, int page, int phase,
    1334                                              int reg,
    1335                                              enum pmbus_sensor_classes class,
    1336                                              bool update, bool readonly,
    1337                                              bool convert)
    1338 {
    1339         struct pmbus_sensor *sensor;
    1340         struct device_attribute *a;
    1341 
    1342         sensor = devm_kzalloc(data->dev, sizeof(*sensor), GFP_KERNEL);
    1343         if (!sensor)
    1344                 return NULL;
    1345         a = &sensor->attribute;
    1346 
    1347         if (type)
                     ^^^^
This code assumes type can be NULL

    1348                 snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
    1349                          name, seq, type);
    1350         else
    1351                 snprintf(sensor->name, sizeof(sensor->name), "%s%d",
    1352                          name, seq);
    1353 
    1354         if (data->flags & PMBUS_WRITE_PROTECTED)
    1355                 readonly = true;
    1356 
    1357         sensor->page = page;
    1358         sensor->phase = phase;
    1359         sensor->reg = reg;
    1360         sensor->class = class;
    1361         sensor->update = update;
    1362         sensor->convert = convert;
    1363         sensor->data = -ENODATA;
    1364         pmbus_dev_attr_init(a, sensor->name,
    1365                             readonly ? 0444 : 0644,
    1366                             pmbus_show_sensor, pmbus_set_sensor);
    1367 
    1368         if (pmbus_add_attribute(data, &a->attr))
    1369                 return NULL;
    1370 
    1371         sensor->next = data->sensors;
    1372         data->sensors = sensor;
    1373 
    1374         /* temperature sensors with _input values are registered with thermal */
--> 1375         if (class == PSC_TEMPERATURE && strcmp(type, "input") == 0)
                                                        ^^^^
Unchecked dereference

    1376                 pmbus_thermal_add_sensor(data, sensor, seq);
    1377 
    1378         return sensor;
    1379 }

regards,
dan carpenter
