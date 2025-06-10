Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C480528C85E
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Jun 2025 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548893; cv=none; b=hRCMigbLwaa+t7Cw4L81mpfZEV1zt9p1a5W4Z1fcs9irfsM/fbXUo1SHRlsN48mmS1tnQ0g24oGvk0MhpawD1UV5ZdRb1GCn5hWubNUr5A9mNKEHqVgKjquw3VT6nIGZcRrMyj5xVtpd7TF5aeS+CTAkc7CGKfidCubzzU2IbjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548893; c=relaxed/simple;
	bh=TTxxRa+f3UnqcCMRrf4H6liRDo8hs3NNhga3PVqNQvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aM9vFEpJYqSwaL+reJch+bess0ro2yksfY1wnW+5jWL6p7pCjWytRB2FprU4Qctfz6HAO5Y7hUKTJmvKyfvd62y0tCdJpaTTksNEGomTRp36F2J/kw6nyPTh9Qx8CnwmaQBgp/+zaliKaUsOjdtNjwNTNRs2POzvRG96qkdGmhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=GLQqoUBz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="GLQqoUBz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234bfe37cccso63859475ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Jun 2025 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749548888; x=1750153688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zQmyYaU/03+AJvFIA5fRBrVmM4eOz2li116ucuEnt8=;
        b=GLQqoUBz0Jk86m0AqZ6Lyp3F5ESe6dKpMmUyA5ecP+6iVOVbUGtMwgD5BHeq9NgzdC
         ifr7E43rA5ZmFITTUZ0cQjm6TWYbvKAjeBILQWULdrJTETQ4gjQtoZJykBdORCszdqvB
         35vXbJtjgSHsBzOCLxOl+JtQHQrGNjyBv9U++uCG2kSEOtuva8Y5eAnJixWFftsPMOpQ
         3+tbF3x6oq43Nq4zjDx+86BIyDBDRKgH84Rd5jmAdsaEU8hqp6yfD8h2uTD4geEJC5j6
         Vpcuf+4IWcdhbS2f2ASgTx1exFCSvkOdbxY0NG47Gay5J+GOziQMN3YDQSBAX3m1bPFq
         gG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548888; x=1750153688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zQmyYaU/03+AJvFIA5fRBrVmM4eOz2li116ucuEnt8=;
        b=smw9VVD8srx3EULoqVhZIVu+4ZazHmwnAWz+NyhGKbRbHmHfTE1Mtv+EhgBLvOxTkP
         ilzrrs9WWvS6gLzTlH9UaMfg9BeGN5srpO8ooN38Pv5ym3J99nnJL/0EMqPQi4LPdHb7
         SPOM644dShGBu5ADCXBuzUAlVAY4sq+yurkyYESfCpVnS7Jjiq0Re88i616D1LgKgRPe
         /CWZ4/wwC6ss7/5BX7xbkg4rqckmDuxUEQs1l56vkaEglp9ZkX9GfieIvAg4xiPWha0L
         6VqrgoACLls09f2iATyn5CPkEcGwcg3PVAPXATDjMz6g4n6j2drxCOqelAb/pfLZLW98
         LQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8b3URJ5TmIVEUDoaiBVvCti2bwtuW3MmaxRkb8tACLqEH2ePeVW5qsg+LzjOmMP3YkzDAa+ILRlIw1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKraMmf3bdOIiWdTUIwh3Ft7zxNso3Xpr5QIbfnOAMpM/FnVdo
	ZFz36m9UvsS1CxgMvegeMnjaXvqQoJAR5LAF4MDrcvbHUXHpUdNG1ZJEoB9X3CvHhLRfN+J7ZVx
	4FT6F
X-Gm-Gg: ASbGnctoT8NqtjvBygnGGkXm71v2j4+PwuDEwEF7eZoxPacnzn9dYUi0T/cOnySXVth
	EDmI28yuGujj8d7TeRMGiREI8W6O9CGjLOvfqirbP6AsLHeflFs4/8nnspckQuGBxnkDocBdaEL
	TPquu3qduOYJFgSRo2V+4cXot/FRwDvU7jPlMb6zcs/khOIDJFGkLaDDVlHZ+22Bn/Q9J80T+Q7
	1zMhm3WG4MXZHcvdQD1mCImoPMJazE7I06N8xyeb+43U/GES3AHSHWpmMsuOwX8wZovWO+n+tEW
	NfogKpYBd48a/ycW37Y8V9lu8/T3aHMWbsS21DOqBFlbEg1WCktNsQULc2nEl8/BN6GuAbPWrVT
	gj4oV+X+rdX9nDjs8EPEGqFMwzjhH4y0JhfCxFH8Y
X-Google-Smtp-Source: AGHT+IFTJerKI7nLBzkfbFwxLiCZ8/O3FBsLBWB2rHz59j5SLYJb1rjqSHl7mrROaYWtZGs6ZS1rZw==
X-Received: by 2002:a17:903:41cf:b0:224:1eab:97b2 with SMTP id d9443c01a7336-23601df6a23mr244281155ad.53.1749548888066;
        Tue, 10 Jun 2025 02:48:08 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603096949sm67293155ad.67.2025.06.10.02.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:48:07 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: linux@roeck-us.net
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	chiang.brian@inventec.com,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v8 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Tue, 10 Jun 2025 17:38:12 +0800
Message-Id: <20250610093812.164960-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <156dc4d6-071b-4cc5-bea9-4579c140b2f9@roeck-us.net>
References: <156dc4d6-071b-4cc5-bea9-4579c140b2f9@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Jun 09, 2025 at 5:44PM +0800, Guenter Roeck wrote:
>
> On Mon, Jun 02, 2025 at 12:24:54PM +0800, Chiang Brian wrote:
> > The TPS53685 is a fully AMD SVI3 compliant step down
> > controller with trans-inductor voltage regulator
> > (TLVR) topology support, dual channels, built-in
> > non-volatile memory (NVM), PMBus interface, and
> > full compatible with TI NexFET smart power
> > stages.
> > Add support for it to the tps53679 driver.
> > 
> > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> 
> I was not copied on the first patch os the series, so I guess the idea
> is that it is applied through a devicetree branch.
> Ok, with me, but I get
> 
> CHECK: Alignment should match open parenthesis
> #260: FILE: drivers/hwmon/pmbus/tps53679.c:151:
> +static int tps53685_identify(struct i2c_client *client,
> +				 struct pmbus_driver_info *info)
> 
> WARNING: DT compatible string "ti,tps53685" appears un-documented -- check ./Documentation/devicetree/bindings/
> #295: FILE: drivers/hwmon/pmbus/tps53679.c:316:
> +	{.compatible = "ti,tps53685", .data = (void *)tps53685},
> 
> That means I'll have to wait until the deveicetree patch is available.
>
> Other than that, please fix the alignment and, while at it, reduce the
> number of lines in the description. Line breaks should be at ~75 columns,
> not ~50 columns.

Sure, thank you for the information, I'll fix these in v9.

Thanks,
Guenter
