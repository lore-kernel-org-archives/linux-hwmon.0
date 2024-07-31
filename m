Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5894B4409
	for <linux-hwmon@vger.kernel.org>; Wed, 31 Jul 2024 17:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722447118; cv=none; b=rG1vqDGS9cPztvTXa35ZxKHw9JYRh0uujii4A+SumlUCzSZH7VSzoQLWwBJm3rWLO/p0OdIDXuvk3pxJf6mN7FSbvZV6sZgOnBB0ZMCbmyJ5u3rW0nZAnOxSaD8n4crGY9OKhH4cgKCi9FQdcp3Y3ZPgDtvx+6USy/dVfEi854c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722447118; c=relaxed/simple;
	bh=fppVzr7QKMr9hQhDlbBoknQR/y4I9wvv12OMEO0Jw0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPDMFVPFpzI+SW2F2UzkvBgdPo+ZUt5jvVDobfuP1X1pOIGKkXCXqOQt/1tXY1zooYxu4PUumzd61bTfB+fxFTDm3nbNp4hRZr0oPWa4WOqXxxhJ0k9tE5LGfo6HGvqAh9/NqQOMF2LVRNo6mC4CDfdJ8l1LBlTfS2IIxIaAx64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9b8hHBK; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9b8hHBK"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-260f863108fso3625320fac.1
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Jul 2024 10:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722447116; x=1723051916; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pnsCvfkP6/s6LzLVdUgGDvqXOX01z6XqNv57is2UNgM=;
        b=k9b8hHBKGBDk15IFRnl4qb+QADZD7JajRGi/f4E1Aut+na02fJdiDsc6uwuWELScy/
         XV3hYKznACPqNcs5gslmeoPyMIBwAHvitahRIvEqfrUTD4dpEhXtBsNM8n5IDEj11wLZ
         THpdPYtXePoSmL//Qdn+DkJWJbjN4pvjo5XuNFVUfj4HJhhakv6sTgqsiJC7TdfejV5Y
         goBRcv7qHb9A66gVH3mf1amhBOMorqPCyOxdacSwmwa37VcaEvIVKa+qgauuQzf1KCo/
         v7G/HufKtGFHJ3kn4pYuufkU1X+PmVLPQzFLrJfEYgAneU4w8ZZgqjuGbdW+BdMZYWBz
         MfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722447116; x=1723051916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnsCvfkP6/s6LzLVdUgGDvqXOX01z6XqNv57is2UNgM=;
        b=TGEhpMjdGNqhw5O5zH5jjY3XxjQbPp/dDZssi6rwMv2kooFVC+nwolcqaq9nGuRamu
         wNc6pO/1SajglBEC91Hynw/BAuB8ClUSQ6FJp5brkg73xu9fSeIikfLdAbSPmRuumQlY
         SzdsebhHxdW39DUxTB3GMgIoGc5H1+cwmhriQYWJsjSxoTKEMYUkQ7G7D90gmD9Kdvcb
         UJFCYoDP2C67m+l+ZiPB8NxpBwF1Z5k51NVELGvTyLswpRr0zcuOpzFLu09Ipk73tNbW
         AtmdxlZ9EJh6A7FsglFBv9z6q9LIosIweRUVlaZTCEZ9Se5cMyfRNnmwLd5mz2Bpw8F9
         XFXw==
X-Gm-Message-State: AOJu0Yziy5GA9mlcz8xVC9Tdq58vQmdTHeKYMnzwXAlWFPdCrLu79lAD
	9JWy18E90icVULfkygdWXqo4siX28tqjS+Z+NevJ7qU3K5Tc8+exAR1qsIBqITE=
X-Google-Smtp-Source: AGHT+IFjnKbcgf1ARnI4qxV583JgURQMQGjqqy7QscDpKg1y7jN/CQ4f9kKwS49L/hh+j3Z6OxZYQg==
X-Received: by 2002:a05:6870:56ab:b0:25e:129c:2223 with SMTP id 586e51a60fabf-267d4d164a3mr17806375fac.19.1722447116356;
        Wed, 31 Jul 2024 10:31:56 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3b6f:dcbf:940c:1173])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2653de26d14sm2743387fac.6.2024.07.31.10.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 10:31:56 -0700 (PDT)
Date: Wed, 31 Jul 2024 12:31:52 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: (nct7802) Use multi-byte regmap operations
Message-ID: <ba9874c8-cd7d-4855-9e95-0916d313b038@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Guenter Roeck,

Commit ec408845bc0f ("hwmon: (nct7802) Use multi-byte regmap
operations") from Jul 9, 2024 (linux-next), leads to the following
Smatch static checker warning:

	drivers/hwmon/nct7802.c:411 in_alarm_show()
	error: double locked '&data->access_lock' (orig line 406)

drivers/hwmon/nct7802.c
    375 static ssize_t in_alarm_show(struct device *dev, struct device_attribute *attr,
    376                              char *buf)
    377 {
    378         struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
    379         struct nct7802_data *data = dev_get_drvdata(dev);
    380         int volt, min, max, ret;
    381         unsigned int val;
    382 
    383         mutex_lock(&data->in_alarm_lock);
    384 
    385         /*
    386          * The SMI Voltage status register is the only register giving a status
    387          * for voltages. A bit is set for each input crossing a threshold, in
    388          * both direction, but the "inside" or "outside" limits info is not
    389          * available. Also this register is cleared on read.
    390          * Note: this is not explicitly spelled out in the datasheet, but
    391          * from experiment.
    392          * To deal with this we use a status cache with one validity bit and
    393          * one status bit for each input. Validity is cleared at startup and
    394          * each time the register reports a change, and the status is processed
    395          * by software based on current input value and limits.
    396          */
    397         ret = regmap_read(data->regmap, 0x1e, &val); /* SMI Voltage status */
    398         if (ret < 0)
    399                 goto abort;
    400 
    401         /* invalidate cached status for all inputs crossing a threshold */
    402         data->in_status &= ~((val & 0x0f) << 4);
    403 
    404         /* if cached status for requested input is invalid, update it */
    405         if (!(data->in_status & (0x10 << sattr->index))) {
    406                 ret = nct7802_read_voltage(data, sattr->nr, 0);

I believe that the mutex_lock(&data->access_lock); in nct7802_read_voltage()
was supposed to be deleted.

    407                 if (ret < 0)
    408                         goto abort;
    409                 volt = ret;
    410 
--> 411                 ret = nct7802_read_voltage(data, sattr->nr, 1);
    412                 if (ret < 0)
    413                         goto abort;
    414                 min = ret;

regards,
dan carpenter
