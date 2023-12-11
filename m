Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQQeaRMB"
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5C69F
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Dec 2023 06:39:04 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d0c4d84bf6so25563135ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Dec 2023 06:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702305544; x=1702910344; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ERv8aryffKBt0vMmMSsuglU1rAb/HgQUtGv7zuphxq8=;
        b=OQQeaRMBZv2ZH7C06l8OAPcKmTPi/HPC/QEg1Wrt5b5Bvd19REy/ESwcnPbDbxP3NT
         6/SWmQoIH3mMb1wBjA/RbuU6O5SWMBUgZ7oowig0iEhKO0/eWBKnTI784YIObozwrxSi
         P/s/iwyoe86VQk/50Q8JHpeWapg8KIiR6+4UrqF2uaElDLOJfHQVQuY3GLvCC1XLjGWi
         LpuG1vR7DmDiW7b8x644Dz8GViJIHAW9fcEjfR3+h8qp5ztGNMdqnpamZZF7a3WSXl0n
         bYlqc3ZA7Q98Bz6yeYqgUt5E5Mv2QRiPLTteI4TvUeGEAGz45DNfJY3A6ThAeuNjxv/d
         RKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702305544; x=1702910344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERv8aryffKBt0vMmMSsuglU1rAb/HgQUtGv7zuphxq8=;
        b=FxgfVg3jkw4ne6ORw+c960isygSUSaJ9mZHkJsR3irJSIvWHsdMwpZvbkyRsGTL1H7
         4BFhCQrWyjWopwmyEnlJzWHQXMZel0n9dnZGKJS2dJwZ+2Abcw7kFZpyKmm5OHaxWVJz
         XL6yOiJ1qqNucuqnWZne+oZFIwq7iIX6cf5xUyl6WzZtIHyNbWYDoZhnq5n3lbD5X+no
         4aA3G+mytXHWJBkZWByd/bEGyPS5BEU1xobtnkaTHArAqRNoH5zEIOaoSJEpOPIG1ejc
         UZl2ElWbQHJz27Wi2Zdg14xcgeLMYeCVfn4st5JHRIO8XlppXnNw9B5QC4FdtfRYsFjV
         4ZmQ==
X-Gm-Message-State: AOJu0Yy8SJD+8g8dpfpEJ++9MQ1Y8wqHS08wRA1rwEE5QbVkcsahbVQO
	ToAbkPk0kNUHdMvS8JFAEBP6JTQDvhM=
X-Google-Smtp-Source: AGHT+IFLaKhlS0jpslsXmcdicqdFxoYk90RqFVKgYR1lMZGQuwcTs0AjDDkm0mBfujS1LiXGO/wmag==
X-Received: by 2002:a17:902:b60f:b0:1d0:711b:c926 with SMTP id b15-20020a170902b60f00b001d0711bc926mr1717752pls.110.1702305544341;
        Mon, 11 Dec 2023 06:39:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001d0447e7fdasm6757619plb.269.2023.12.11.06.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:39:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Dec 2023 06:39:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 3/4] hwmon: (smsc47m1) Simplify device registration
Message-ID: <40402257-8b34-4bc8-a14b-70b4f9ed141e@roeck-us.net>
References: <cover.1701957840.git.u.kleine-koenig@pengutronix.de>
 <ab326fb9b1ad2191583b4cb3a8bd624dfedb908e.1701957841.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab326fb9b1ad2191583b4cb3a8bd624dfedb908e.1701957841.git.u.kleine-koenig@pengutronix.de>

On Thu, Dec 07, 2023 at 03:09:31PM +0100, Uwe Kleine-König wrote:
> Use platform_device_register_full() instead of open coding this
> function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied. Removed double empty line while doing so.

Guenter
