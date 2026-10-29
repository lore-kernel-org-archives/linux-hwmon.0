Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284789;
	b=RH7WNH/0T+S2nt70pD9VQt/8yR7dPPs4GKNqJ7r3xr9n8cvXEf6m2b068fVVJOiZat2x
	 Le4Qp+wMa23YlI4MgBLNbXSi8bod679Ao/xrI4s8R8Y8LQLmD4Sc0ezmV3A9N28j35viD
	 q+7kJ8lcvy+FFh9XisreDJIT0k+48dwUfH5kOCzXYNLsG9w7/zlQKpQXD94TDqlRV83Ol
	 oem/1TrMF+3MeAVrUsbmv3w8WbyUlhPVXdHQVkTYIlc9TYFLSQ7zJ2+2csBFbIvf1vtQI
	 n8b6JB1D0yS1t6chsrCSMnwaP4+UuaKss2/xpKg+0sao2AWU4GCZQyK0Fxa/xZitnBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
	b=hjALT4WvmKpX+KnJSCKIOs3TiXB+tMPvheLnQWLmtdRZV24F39ypztcvv6nPEdLgUQa/
	 mFGt5S8WlgX6NalTjVv6TDr18dhweit0CCKUBnaroVlpB726sJunuN4603eYX8mgmQDCf
	 M5olWnKUXJbHcHjn1GCXcRKiqswv3S6J81LtOzNZfU5iIcLBef5WF2hxWHlEOVyBhMAle
	 Unm2KvuloLXfeBNHP8+yALWHClJZop7M0Sj9xCf9ZaI8yYhUFoCu+nGa0t7XL6v3bA07o
	 U5KznB5EJNKfNLKpCw8C8WWKSGr37PncgPOQEw4Wr9yQqPqPBD8TLCxRziijUvzbGkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPTlg3YK;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C2D606A321
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 14:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C2D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPTlg3YK
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14fc585291cso1992556c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284788; x=1793889588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=fPTlg3YKi8LCEYl7MWaRXbl+fOsMT8EooFaEX/qteZRl8FsZt88RyX9Nz4rh62atDU
         N2mi9nkHHOJC4qFeiUXhTHbjbhHQHXOF+NhhfCQK6iUf4J/Q9ypFok7z2wgCKAPn6EjK
         xZ9kY5ZnP4n+8lX6/VsHr77Tn99+eesUK7yOJOQntEtEMQGRE1D1vlqqCLeQI7lI9/6d
         T6b6GWLz4O6TATQ+xATuCOZzKNxV75JOEocPZj36+KoGY18UuoHpbDZjja7BkGHZcM0B
         8XE+KTQjlqXnRe4OF7u9IeoFkO5y9EWni2EDctTAKHudHO9Rp8OhbT05Vxxf/IOtY+cj
         QvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284788; x=1793889588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=hDxZCEWKw7kRP+EvJjcJoAgMg3eLfTbxJWYjFYmJpwrVo0gOaH+FIkiPM/yYJp0eVC
         kdm1XSwPKzcrO89FfhXcuyJ2n1lVA3anG1G6ijYvqIxx1LKaOHQ5Kot69hTIMoBUxdq6
         quGqXbOZMvVZfmQwj+H2Ez3grjnEU2ewcWwVG3h06HpamzOKGZDfGk7WMZOO9huMXPqL
         oBIGqWzYURAMKqQWfOvVr1c8Ka6gD4iRkYKJlZFSiivgm/LobQfNkRWXvjvefduHsJkP
         I2k/T9NfIHKrYZoxh+DCIVqYOtwgq60yH83FzjwMDINh7YWY7sp7ZGkNDB82XAuqIGT+
         86fA==
X-Forwarded-Encrypted: i=1; AKwUvBwI/oyQHgOovpgr17snA7q+VSvi8taniSG/1Jzii9bmziwi8iqoI8X9/0YQ0k3LkFF3xUOwVPCGE9jwjw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL001FBE9vp7nCp/mZ6gVPTiqNAIbEKpwyjYGE+0ujdaXJTFK1B
	WADPxutOvzRo5iIFJ3S9cv4EXdujTT06bD0Zaqtah1P53Dk4LH3HiTk=
X-Gm-Gg: AYBFou1axAHzpWwY5nJSeWlag5Wsk/43faWcLlHHIoPFrXP628ThNiFiuWuYw5fRHxt
	yTLhMpB0OpTp7+guysIGJBMlAeVaqX+PTvWySy2LOLVoD+ysDMClEIXWpHeRDngXZSK5+Gi9Sl/
	OP/sX7WOJOdqK7nrTSHca6QH8CCtYn6+47cuZLx2ZPNFDxpDMdeyvXQvcfnAIpioKBC9NW6IzVu
	+EDrwf8hyx82Nem2YCjcUUxJET6eDW+iiEVlYDtcN2SHPd74qDIp9tAUF+JEUNbR4cwxZd++AqK
	x2AiHbxyeJiZjKlfQJy5sSRzAIKqMZ7Bps89GOIQf8MjjvoZDRaOP12Oxti8Wi5Z3M2ocbmctHr
	ExSG/3RTda9QAULJM5zAimjOAnlTr/Zrq61VmaR5ykkGNpOMauFc4xK+I7Pi0J0Ll0c7rT2mVoc
	m7fipY4uFF/A+4BAt2j6rE8sqXiIwOsXSbepoaqjiJHCKZE4FBTmeNU6zGQLOyu5r4lALvu0INM
	05WvQMTX0zgrgtOb/mFWnLx2ypYeuLoLIVnwp8DR2rrXqRnl9bGU+fHF69hovwkaHi5eFoHrO86
	z+W84A9A7+OIxmn96meVQ3jNJjradSSljATnECioJPbaKj4X50Hudg3mBdNUwbJfAQk=
X-Received: by 2002:a05:7022:ed07:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1a6ced8e7afmr7393000c88.29.1793284788293;
        Thu, 29 Oct 2026 07:39:48 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.115.216])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75cdd21c3sm15396439c88.4.2026.10.29.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:39:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: k@chaosmail.tech
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jic23@kernel.org,
	jmorris@namei.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Thu, 29 Oct 2026 10:39:26 -0400
Message-ID: <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
References: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This should either be dropped from the series, or be hidden behind a
> `melt_my_mac`-style module flag, or switched to a whitelist approach.
> We do not know what keys will be introduced in new smc firmware
> versions, and there are already keys that should not be randomly poked
> at.

1. The patch is required, atleast on intel macs, as without writing GPU and CPU
	states to smc, the system gives PROCHOT signal under small load
	, and heats up a lot.

2. the smc dosent expose keys of nature that can physically damage the system
	it only exposes power/volt data, and the most you can poke is reboot
	keys and gpu/cpu p-states.

3. If a person is randomly touching keys, Its their problem and not ours.

4. There are a lot of things that can mess the system way more and permanently
	than smc (undervolting for example), but they are not safe guarded, why
	should this be then?
