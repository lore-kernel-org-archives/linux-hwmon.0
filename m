Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTKDmK2r"
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23A39F
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Dec 2023 06:40:21 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-28652d59505so3479523a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Dec 2023 06:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702305621; x=1702910421; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84aajq3S5sy7zvTFwoBuAp9Vt7HV4bOzNj8Fa6a8uBo=;
        b=GTKDmK2rA/tvMfHlgG9U+gExfbnt221VKmMIiB8vO4P8kwsmAOwHXHv5HtvAr1KLsR
         ofLnkVtBD/Gk0/QyBYdCa9XH3mZQaRRUKVKwXNAlspG75NuJjbJaSvuKRBwmdBx3RSyY
         OX2eoNAU5GBVhNWqaVXQHO8cBV6Wo6FHpKBZNOvWopU69q9l87+kRAoUUhKTL9CiWFbf
         1efqF22gYoj56z7NkcQYVoz27MBqW1dTcM+wkeoelaaScDgMv2hhNeW0LIQP15FQeSl1
         MWtMmWLphZEM0TMSIZxJ2Xso3pBHm03cr/3f/VUPNtDzugN+z+ZEssUjwbRNX4PAr6V/
         ZpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702305621; x=1702910421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84aajq3S5sy7zvTFwoBuAp9Vt7HV4bOzNj8Fa6a8uBo=;
        b=Y3H4N6VH1weaEVUkmH+BDmIkyPJoFunZ+RY+S5cNzuLfSpjF/7xOBkHumsI1p7C0Pv
         3hPKuT2gVC9JG5iMU/k67nXq6Rf0EkExm8P4A/aG6gyiRkoJFnHcWOb1RGRmyjnpB0WM
         +C6pjvOoQKqlv8do9cGhDCGWMY15g/ZgOxX4VOE4q9QqHHJXy0KqanpIJiPVmAgDuAo+
         AjITKbIG5R3iBpfJSAkmQ770im6ufJI6YkbJCNzIvvs44rD0zD3ImIT/MXXVjS61UMQE
         7bmP3aLWI94F8YU9nq737TtlBcOcxPlOXQ0EWKrBTH5gnWV4XYMQT/sbdcI+kBcc3EoN
         13bQ==
X-Gm-Message-State: AOJu0YxXszUVcCn0puxFwoRA5lbMEdqYaCWu18vJtjDENDnzckcp0FLY
	H2pHCIooe8rHhpvvB6pBv5s7gLY0T4o=
X-Google-Smtp-Source: AGHT+IEffxCslF4FtqSSynzYAq+CP3Aiqtm9nC7EfT4OLx/sm8bUsL2VsfTorRxJjKd1lMs7LkcCZA==
X-Received: by 2002:a17:90b:156:b0:286:7469:b133 with SMTP id em22-20020a17090b015600b002867469b133mr2050369pjb.23.1702305621392;
        Mon, 11 Dec 2023 06:40:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ot15-20020a17090b3b4f00b00280070a2613sm8571267pjb.51.2023.12.11.06.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:40:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Dec 2023 06:40:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 4/4] hwmon: (smsc47m1) Rename global platform device
 variable
Message-ID: <7eb48026-61e9-443d-9cc2-cf541ce233cf@roeck-us.net>
References: <cover.1701957840.git.u.kleine-koenig@pengutronix.de>
 <68a959b56da7f9452557d08c72249182364b0dd0.1701957841.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68a959b56da7f9452557d08c72249182364b0dd0.1701957841.git.u.kleine-koenig@pengutronix.de>

On Thu, Dec 07, 2023 at 03:09:32PM +0100, Uwe Kleine-König wrote:
> pdev is a bad name for a global variable. Still more as the driver has
> functions where pdev is a local variable. Rename it to smsc47m1_pdev.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied.

Guenter
