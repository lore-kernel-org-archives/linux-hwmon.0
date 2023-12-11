Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDDZOeP5"
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74F1B8
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Dec 2023 06:36:10 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5c701bd9a3cso607612a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Dec 2023 06:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702305370; x=1702910170; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=11oYP+KAO4YyHJKYsLusmbpQmN1Z3zaQ4UDwdYUqd3s=;
        b=XDDZOeP5I/TaKU5TMoDKRY2pxEYnfQ6z/ulpkpH6cDapE8NoCNY2W7Qmi0D2Ta9cf6
         g9y3AQyQ+57k1LZrzf3HzELFmQ3mv4/R3zArBdLKOvdKeRNa9yCQBwCs3IM1J+kbQ3U0
         pzuhmC9UdPNnLrs86BmVT9QKNYG5NIVj0czFWmajxNQT8r1QGYI6I8zxQqnOZ2nyBusH
         Z2J/ON3ve+dyDDhlk/R4eVFE5Gl7aPONMb0M/RugJoDhGslf36O/t+OWOZuIBfmPr7Pc
         QdR4YOxAypWXbFCZe6M+d4F5gmAWDKeIrR453l+hzbz84MNHB4iG4vwMwI8NYbv5BC+o
         zu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702305370; x=1702910170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11oYP+KAO4YyHJKYsLusmbpQmN1Z3zaQ4UDwdYUqd3s=;
        b=e3oTeJowtcV9o4koWaj47oDv10U6UQXvsA7PoZoFK6yOO2yGQw18I1ZaZi8QDFzBkI
         WlQRzJBMS7ZnFab/soE5gUTAPDs7+evSp/84TqdJKcFzqfHmo4PhBCr3T04ki+3g32OL
         ljWAsIsNgK5qhHKHxJvzt1X0S84BMlGAjXTuC/iYSp1bk25L7S3cdtaAWkqlKy1UAGyy
         Mu8zs1iyGV8hBMEiarYMl4zvVFDzCvSq93x9xi1tO38u7+ppHJ07mLl8qM/geGrsFhUI
         00ZVSUVHF3GtqIAu07eOiKdWSUHbh79NfDBjVyOagQN7nWz99ZxiwVo+nXwq7NQ+gHQH
         WA+w==
X-Gm-Message-State: AOJu0YyUPT4UsTTIl5ot5sz80Apy1WThEa1YXKhbRu42StR1kZHD3woa
	H0m904GMemnilMxSrQPA1mM=
X-Google-Smtp-Source: AGHT+IEZqLXAUlzKTw5hmb0lOfCl2+9eJYm54PhzhzE2EBh3viXLTSwHBD6nk8HcBXrx9KGwXJ4e/w==
X-Received: by 2002:a17:90a:68cd:b0:286:7609:5145 with SMTP id q13-20020a17090a68cd00b0028676095145mr1482222pjj.62.1702305370232;
        Mon, 11 Dec 2023 06:36:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id sk13-20020a17090b2dcd00b002864c14063fsm7168539pjb.20.2023.12.11.06.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:36:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Dec 2023 06:36:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 2/4] hwmon: (smsc47m1) Convert to platform remove
 callback returning void
Message-ID: <80d987d8-0977-4324-b1b2-f8024962123d@roeck-us.net>
References: <cover.1701957840.git.u.kleine-koenig@pengutronix.de>
 <a732270539ef63094a32d0ff582f78e640caf3e4.1701957841.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a732270539ef63094a32d0ff582f78e640caf3e4.1701957841.git.u.kleine-koenig@pengutronix.de>

On Thu, Dec 07, 2023 at 03:09:30PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied.

Thanks,
Guenter
