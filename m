Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E1F84FA2
	for <linux-hwmon@vger.kernel.org>; Thu,  9 May 2024 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715284586; cv=none; b=G4xlA3x2ODGwXNTOk8zj1ZM9Tj/F5tiF9O0lDUHxjVcuYI30B8kb9+9nEO971FSTRwpK+WFAgOwxq0JP8Rb5gjjJSHnY5M1u7D8tRk+vL+tsupwNfApcgM5kGLnUe3yjdUw2gOyI2YSvaG5Ib9EHbEbTwPYq6HinIlrgKOO2k14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715284586; c=relaxed/simple;
	bh=Mhm0vd+DonS/ppCcdytB9Id0EIWL+7NWMI63wa4UpJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+CvczKhs49gY6XkvMAtOpK2M1wk/Tihp79D4K7OOFl/MXmQNhts60ez0GsdiEX1oIQ9WyyUD3VVTBAh7lVNYERopkupAtya+SbHigobAvtbWNK219s1LaVnmbe3yoh/GY7vzoQO+J3vU0nOi0Q+TLyg8NCo4di4+83toSQ+qbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSt3aSAE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSt3aSAE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ec4b2400b6so11687775ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 09 May 2024 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715284584; x=1715889384; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEI0VuFmUnv+i/5TxLZ72ScjYIDqGgwTe3F+AkRggi8=;
        b=ZSt3aSAEYSU31vuv+TLy1AcvvwnTf423QqYtmj0oYws29ykbDD+glfgXxNIbIBHcnr
         gDBVZzXuDKklQn510HZVUiqGEp9DQpU++/kf4A069SIh403zXxw9zfdFxvpvMfBK60iO
         O4dh8FghRsZFNraP7qJhEqUruQQREC9qotmrTTibF9QfW1jDxiIheomPAz3/xiT2EJTw
         RU8eqm865Oz1LEQOc3x+t36zYbiqWJu/2fq2nBOnbFjuk8Ex2lhYK4ZgrPaa/qhyl8GL
         pBK0C7rtxlaTh3npTG8+8uP95Fq5oHIrkyKI6SoaQv08+7QMtpb6NU0zCY5fR7tTgm7I
         D6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284584; x=1715889384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zEI0VuFmUnv+i/5TxLZ72ScjYIDqGgwTe3F+AkRggi8=;
        b=GuT8nfn9D6LiqMjeNTkZ6Ne0KfOJzeZ8Yl5+/h/rbmjPkxZAiWcLtTcYQ+2j7e1g6C
         IgGMI6lWk0TKSGbX5skyV9g3K2+3m2LvRZ/ODGyLvRKA6432bu+uzswWdOq5HK1YYmLC
         gH+8VUlUqgG6fccTeQRUyr5VlFp2MM2mn/qfXN1hf19MxEF23xu4lnScRA0cO4uzy1u6
         MNTZ1Fb1gyYnSM6YaJlAoblhH2o4jr8a6mpeBKBzkaeZi60k8I++4V6MKs4yvRHfq9Bl
         LuahSPIpsycD4bCH+nIxG+uS7NV1MATEImP6q3WwVFuIks9pHbKQpSOvtShevhtGNH7+
         u3ww==
X-Forwarded-Encrypted: i=1; AJvYcCUl4n6A5hI9tcSFfpzgCHZGvO71u02Sop53oXCIsprV8yfCSBWlSP5awTLX/T9T0kI4MdfWrCngquXTyzTb3fIBTOeXG9Q8TSYFZeM=
X-Gm-Message-State: AOJu0YwE1wp5SB6f14aRXIndwlE16AUTSV3KBqwQlddMJU7O0273YNBf
	fQL+SY0S2QyoJvdi+WIDOhBunXFZ+RDOV5ST5CK1k7D2zqWDplfH
X-Google-Smtp-Source: AGHT+IG05d8hrJf4JeaZFSazgqx1oB+RU3S9Z/AdKTFMbPMVL/36TdfAc/iSVViNUynrkKtLQ6oUog==
X-Received: by 2002:a17:902:d2c4:b0:1ec:304e:90c4 with SMTP id d9443c01a7336-1ef43d1407dmr8202745ad.17.1715284583691;
        Thu, 09 May 2024 12:56:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30fc7sm18079485ad.133.2024.05.09.12.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 12:56:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 May 2024 12:56:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jean Delvare <jdelvare@suse.com>,
	Daniel Nilsson <daniel.nilsson@flex.com>,
	linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0 (part 2)
Message-ID: <9af4c159-ee14-4f41-a6ca-72ee67deddd1@roeck-us.net>
References: <20240508072027.2119857-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508072027.2119857-2-u.kleine-koenig@pengutronix.de>

On Wed, May 08, 2024 at 09:20:26AM +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> This is a follow up to commit d8a66f3621c2 ("hwmon: Drop explicit
> initialization of struct i2c_device_id::driver_data to 0") which I
> created before identifying a few corner cases in my conversion script.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied.

Thanks,
Guenter
