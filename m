Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0015F345CD0
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763647076; cv=none; b=Yrtv1244oeAAnVQxei7MpgZxf2lHmOesoI0IZ9Po6wwzi4fhe+tLvcdakVVNqh2D6m1TMBa8D2POR1dnuyckdOz9IgVBPRE5bZF5OZ1APReKituIJV3KA1qQV0PEKXCK/gil67xI6GT6VrRtSLM1KA8dE7BobZ928Gqwc/Sz1Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763647076; c=relaxed/simple;
	bh=gKVMCyHKvCnF2wAZ/yTSWMxep7Hlh1KP6H4L2m0nfrE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=i6YXQ7vpTCS2JnR/6fMMUxLR8Bj6CzqFuI7Z70MQkzk/WNf6TIxbGetW5Inex4ZizhjMBoXUDsSIY9hUYdXDVs0KWsLoIOqC4esCqp48v7xpOLHkWWEHv3x5AevYH42pr2ox9PNW4nj957QoErQB1wKYPWZ3SJf7/hj21gwy2LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kota.moe; spf=pass smtp.mailfrom=kota.moe; dkim=pass (1024-bit key) header.d=kota.moe header.i=@kota.moe header.b=Rb5bCS2r; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kota.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kota.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kota.moe header.i=@kota.moe header.b="Rb5bCS2r"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ee0084fd98so6685201cf.3
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 05:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kota.moe; s=google; t=1763647072; x=1764251872; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/6l9Nat8zS9ulnmxqu4kh/l5ORnLVRWAdulFkiSTj6A=;
        b=Rb5bCS2r0cBYNQE/EXCr16FnjRa78vcm3fBIhFSgO8z9V7Xwg/PNzmv74Zgfl2NjN+
         4H4qtbKP5pyyo4AIcRU24qLcbCnGFAjfqbOBTBSzkZ+hC9X1JDMvSA9N2+751EW3no9r
         nBo7O7XZ/sk1l9Xcz2o5wuYrx7+y9nO11kyfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763647072; x=1764251872;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6l9Nat8zS9ulnmxqu4kh/l5ORnLVRWAdulFkiSTj6A=;
        b=Qi7SxPBgm6eEM/mwD/rDkqZcqAlUL1vOFNRlbr8VjIfqXcT9yXMnXdqFscu3RlmpHQ
         P9r42gyyyA4E/DN80OuolzWHDMwv6W42sgEeGtflTQDRgr5ceezKgVo6kmFlV/1lfw8T
         FkHtKZGC7JF1qMqmJKPQgGqU9z+7/62h++8X6oxxM/zqMPuUd1JKaDMbqXNH6gQcMBIS
         vjz5lvNhVVs0JfOt6kX5zFUDbn9ZMwx51F8L9E1QsvctPwIc85ZKmiYp08HeJTYTiUcZ
         g1TF9e7BC8cKIrhdKHmcwluUF1uSWYi24kvi20JARSBeNCfsdiuygvwPUPdAY2zr8c7K
         GzZg==
X-Forwarded-Encrypted: i=1; AJvYcCWr+GhNizlBMOmfIP8G4UAVOaMQ9//kvj3mdm5b/Xh282iBNqtxXhtZbVraA3qSQNnHzcK3SWk4MjGpBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq91E+wahEMQTO7t4Pm4tsTKbmPC9KhwwGnrRdV78ifAJLbJZd
	8dGM9RUHjc55KX4sWSlXy1XLTseMwv++9d8kA0Wzu2ISX6Nei08j6enqwFQNHWqYmFPAWYb0ECM
	lPtMJO/UGzpkRHYsOHi9wX3M/nf4gVZ+BzAgPqjGv3Q==
X-Gm-Gg: ASbGnctKX3f7T5DIjKPZ7EYd50Wdu6j5bp9bQ7gwTpQPgjJ7iwcuMWkV7gPT1biqxXz
	SJGWnoSYqkkgsjxDg6wt3vcfFdY1xi5QMF8QU/B9XZ2WeoP+H/fpq4UaLaYBANfGLMZh7L2Xvme
	fTrqXknNnJAA4+O3dBa+T2I7S3QWvgI2Q5eAYV1JJmtSNklt5N9IjvHaXLgR3cdjVWroBpBTKm7
	lnk9Gepjk9tVPblaNbFjMarfoW3pnjssTmOUBfkeMusErW6q8lth3v/t7CrmrM9ibDo22atYRbV
	8IPz2gWI7wZCbR0bj8E687EJmDw=
X-Google-Smtp-Source: AGHT+IGjjKbJY9jDT3RLIiCpwLBiFli0RBMZPvs1LYrURfbZWDSx81xl0Tehl+9jWE42Z6EWAgm3MixcjMVTiukcQKM=
X-Received: by 2002:a05:622a:1986:b0:4ed:a7ba:6a4 with SMTP id
 d75a77b69052e-4ee4946da6dmr39541661cf.22.1763647071626; Thu, 20 Nov 2025
 05:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?4oCN5bCP5aSq?= <nospam@kota.moe>
Date: Fri, 21 Nov 2025 00:57:15 +1100
X-Gm-Features: AWmQ_bmUN0kFW_7VM4prCWnhF87qcy5NptzMKM45RWtHZ6-A2DGRszeBNxMplF8
Message-ID: <CACsxjPbcjDPLVfnVncumKVAL16fgBXr4kUGbH4hW+cZiJTe_0w@mail.gmail.com>
Subject: spd5118 driver occasionally produces erroneous values
To: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, I have just set up spd5118 for my Asus Pro WS TRX50-SAGE WIFI
motherboard and v-color TRA532G72D834Q RAM

However, I've encountered it occasionally producing unrealistic
temperature values.
See this graph collected over 10 minutes - note the temperature scale:
https://files.catbox.moe/yt8uqp.png

I wonder if this is a known issue with the driver? Or maybe it's some
quirk with my system?
It kind of feels like a race condition...
If I boot Windows and run HWiNFO, it does not exhibit this behaviour

Note that spd5118 does not automatically attach to the I=C2=B2C devices, so
I have to manually do it

Some details about the system:

kota@home:/tmp$ sensors spd5118-*
spd5118-i2c-1-50
Adapter: Synopsys DesignWare I2C adapter
DIMM_A1:      +46.2=C2=B0C  (low  =3D  +0.0=C2=B0C, high =3D +55.0=C2=B0C)
                       (crit low =3D  +0.0=C2=B0C, crit =3D +85.0=C2=B0C)

spd5118-i2c-0-50
Adapter: Synopsys DesignWare I2C adapter
DIMM_E1:      +47.0=C2=B0C  (low  =3D  +0.0=C2=B0C, high =3D +55.0=C2=B0C)
                       (crit low =3D  +0.0=C2=B0C, crit =3D +85.0=C2=B0C)

spd5118-i2c-1-52
Adapter: Synopsys DesignWare I2C adapter
DIMM_C1:      +47.0=C2=B0C  (low  =3D  +0.0=C2=B0C, high =3D +55.0=C2=B0C) =
 ALARM (LCRIT)
                       (crit low =3D +192.0=C2=B0C, crit =3D +85.0=C2=B0C)

spd5118-i2c-0-52
Adapter: Synopsys DesignWare I2C adapter
DIMM_G1:      +48.0=C2=B0C  (low  =3D  +0.0=C2=B0C, high =3D +55.0=C2=B0C)
                       (crit low =3D +15.2=C2=B0C, crit =3D +85.0=C2=B0C)

kota@home:/tmp$ sudo i2cdetect -l
i2c-0    i2c           Synopsys DesignWare I2C adapter     I2C adapter
i2c-1    i2c           Synopsys DesignWare I2C adapter     I2C adapter
i2c-2    i2c           Synopsys DesignWare I2C adapter     I2C adapter
i2c-3    i2c           Synopsys DesignWare I2C adapter     I2C adapter
i2c-4    smbus         SMBus PIIX4 adapter port 0 at 0b00    SMBus adapter
i2c-5    smbus         SMBus PIIX4 adapter port 2 at 0b00    SMBus adapter
i2c-6    smbus         SMBus PIIX4 adapter port 1 at 0b20    SMBus adapter
...

kota@home:/tmp$ ls -l /sys/bus/i2c/devices/
total 0
lrwxrwxrwx 1 root root 0 Nov 21 00:02 0-0050 ->
../../../devices/platform/AMDI0010:01/i2c-0/0-0050
lrwxrwxrwx 1 root root 0 Nov 21 00:02 0-0052 ->
../../../devices/platform/AMDI0010:01/i2c-0/0-0052
lrwxrwxrwx 1 root root 0 Nov 21 00:02 1-0050 ->
../../../devices/platform/AMDI0010:02/i2c-1/1-0050
lrwxrwxrwx 1 root root 0 Nov 21 00:02 1-0052 ->
../../../devices/platform/AMDI0010:02/i2c-1/1-0052
lrwxrwxrwx 1 root root 0 Nov 21 00:01 i2c-0 ->
../../../devices/platform/AMDI0010:01/i2c-0
lrwxrwxrwx 1 root root 0 Nov 21 00:01 i2c-1 ->
../../../devices/platform/AMDI0010:02/i2c-1
lrwxrwxrwx 1 root root 0 Nov 21 00:01 i2c-2 ->
../../../devices/platform/AMDI0010:04/i2c-2
lrwxrwxrwx 1 root root 0 Nov 21 00:01 i2c-3 ->
../../../devices/platform/AMDI0010:05/i2c-3
lrwxrwxrwx 1 root root 0 Nov 21 00:02 i2c-4 ->
../../../devices/pci0000:00/0000:00:14.0/i2c-4
lrwxrwxrwx 1 root root 0 Nov 21 00:02 i2c-5 ->
../../../devices/pci0000:00/0000:00:14.0/i2c-5
lrwxrwxrwx 1 root root 0 Nov 21 00:02 i2c-6 ->
../../../devices/pci0000:00/0000:00:14.0/i2c-6
...
