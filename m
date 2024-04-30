Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14142176FBE
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714498547; cv=none; b=Gzgwv0xp0yQ+Fgmje8KcbDpo32E1MFXl8Yq5ySPUxQYWIkn8UQ/1xC6S+Y5GasJ4MD8sdZRIDnMzbibLRn4WXhOTV+2oVSMuYUqFqpOMIWb/rdXQlVwBJELtSCPQUwQC5OdN3VE5G3jFd7HHgJ4a+iimnMQmU5ddjaFvBPhMHe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714498547; c=relaxed/simple;
	bh=1wi6zrGO/vZTNMfdsd9LDKqMFbyXEC4GjnVn7dccTak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJmE2F9m39cTQ5Oezd2jWTQalETIOg7ktPK1xZO6B/OwxQOF0tfUwY+CwxpQauoEGOikzXXX5hqS+vvZvNwPfTuYssNK3I8C+uI5lja0ga12Jw6CeggJXZ564PmDluynpsNLpRqXGUqYpEcZ2kt4rvpbxNBVFGU3YUKkLhkK+/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UukpXeMx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UukpXeMx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e2b1cd446fso50316775ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 10:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714498545; x=1715103345; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTI5ueP6oaqJoYiD5aun+vfaGCy8ETsI4dlXXCCalYQ=;
        b=UukpXeMxClN9qmA/iazGK7dLFdrI5fQkNsbTTyzJN6NmKwiQLc9iQk2J8XSWN1UJb+
         OcCdrhMS0L0x5STxKV1H07JqTXDi2WO0axWhPPlZE6PzHNxLvhJmDnq6FY9asOZonEEY
         1KKiWU9EdPYQtcXPES3pR38Cfc7wiLCIst5gpWjRccpaE7obyXL1CHvD/hIPh+6quKrE
         YSdjrUzJ9rPP74dcy1XEzXOxFBZh8jp0yQ8sXLrWauJuERP5wArZ+T0/PEx1p1Xt3zwf
         Un/lLVVxdbIxkSTo8Y15OU5ZaqANaTF4ypHjEIy3Be9Svvtr9XMGy+r63PC1mRyYl8Zl
         QTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714498545; x=1715103345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTI5ueP6oaqJoYiD5aun+vfaGCy8ETsI4dlXXCCalYQ=;
        b=GC9KX7Yytj8LkDGVz4khBXCVVU3mlBxYc95FNnKCyHBpexLimOqNfK75UKtAkQ+b2r
         kKzvmU9eWWmKjECH68a2+gsyxj8WUSIi5a0XizSxyOFVKIgFRkMm+zSXVzie+cJMJeQi
         5IcTAhJyxALRAIVk5ZiW3D7ZigIgFiXj17eC4s3YQsTQO7GT8H01wcGKET7qDi2AkLd2
         6SEL0uIPBUZMzeo5Jy/rmZRKu9hE5nfEmGfsrl9Q/QGLBD9Te1Ol6VV+HLdE9FRYFYly
         F8JFxMDmdA2mCtHpHHiaIWlmgaYIyfgBcWJFUsffQNovSQiYVW+Pidn879ZJSvVqTAjG
         zFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5ozc8toqt39Eih74t0zH19ml1c5yY+d5tQLRUNpo36Q/7I4a+QOAP0ZbgYtGMNIFeKLRJRmgTwjMfzx0lDNdlyMY7OZrqUcaCf5k=
X-Gm-Message-State: AOJu0YxH01Wvd1F9/C+DmMRjpnQ6g0Uea1MpGm4k8yex3gDWmWcqD9hl
	kKoIptgNpv94/TDOjLR3bYWMgW/WSXF2W9xnnpDLOk2LL4gv+IxFCmX5LQ==
X-Google-Smtp-Source: AGHT+IHr602mLoLFetXjqn3j91fknUCM0leEtqr0AAJWYqsI1sM2P5kYoA9hWG3scLv+aLCMz8clIQ==
X-Received: by 2002:a17:902:ee84:b0:1e5:10e5:b66e with SMTP id a4-20020a170902ee8400b001e510e5b66emr90489pld.27.1714498545465;
        Tue, 30 Apr 2024 10:35:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o15-20020a170902d4cf00b001eb53dcf458sm6769866plg.188.2024.04.30.10.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 10:35:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 30 Apr 2024 10:35:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <3ddd7f92-1358-46d5-a3aa-aae82b05b324@roeck-us.net>
References: <20240430085654.1028864-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430085654.1028864-2-u.kleine-koenig@pengutronix.de>

On Tue, Apr 30, 2024 at 10:56:53AM +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to hwmon-next.

Thanks,
Guenter
