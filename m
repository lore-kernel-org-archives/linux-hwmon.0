Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJnbZq6U"
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0634B4;
	Mon, 11 Dec 2023 06:41:53 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d045097b4cso25751485ad.0;
        Mon, 11 Dec 2023 06:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702305713; x=1702910513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9DaHiruHnu1Ugo/eNiPXfm/bzESsaARD0DZgVgoZ3k=;
        b=QJnbZq6UtI1YhCei0Gaa3tAlKU9QPJ7df82DZwpxWCjBB1tXt2SfLi53HrFYyx26Vk
         CEOBHe+0f3wzh5fawIKaZxplL9jlYR4P2pmrpSGDUZYnByGdRtea24048ppbij1s6kGr
         VsoyAeyZ8+ZBtnXgelbRra6tWcnzTWmmW2/jYeW8RWYKe1fQPo0W9S7yofm1GUghTwyV
         5imTFeACMObj4rEQSme7qM8EIxD5L6xm2OOWnOtEdfHy6NFc/Z3AbA2IKCMoz3mlhcvo
         UPg0+kX+JZQiEn4XpgEQsozJ0bZB4fVfVL1BfJ8Y+uezIST3kGHwxGF0M4pDbAhh6srl
         M3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702305713; x=1702910513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9DaHiruHnu1Ugo/eNiPXfm/bzESsaARD0DZgVgoZ3k=;
        b=JH4331o2PH4zDaiUyZORLgs4S89hVh8ruku7ukfFYMR3VeGRz4PBXB9bNNHc9IuhtQ
         qInhkfubn3ZOGyEv3CmUZSqpRetjnYYhB/49Md7ZjWO+X95hlDpJ2OUTUxbRCcYQVUdA
         QilX+tc8SkBjtdCIMSEnEuGPFXF7egKmyCnyVdVJKa/pErV7ZrQO2gRlZZd0VDrn/mtZ
         e5NEgzN2lxgnlBll3WlT345mATkY9GCrUNIgvGNe/Jt1WpPTXLK7x77wT5yk33EUSy3W
         0Z7MdB/0N8oWuzlwADAeS22/5X1Fp87yYD0Ik9M1kG0iMX5g/4/X635W7OSsOVihuUfh
         4npg==
X-Gm-Message-State: AOJu0YwDfGI/KYO6wtP8aIFl5fmZdLmxE33YbOoqx4FvjaZ0PDAwb6Tp
	XQ1YCwtHnYNQcKZSRmduF8ioxRS/8ms=
X-Google-Smtp-Source: AGHT+IFU0Ir8swqWWIKeGisQaCsjK175j5nJ5tGS1mkYhcXbQDjsHUfacT1J59An51dqA5EUbKzOug==
X-Received: by 2002:a17:902:c183:b0:1d0:6ffd:cea7 with SMTP id d3-20020a170902c18300b001d06ffdcea7mr2061723pld.96.1702305713133;
        Mon, 11 Dec 2023 06:41:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p20-20020a170902ead400b001d0b5a97cabsm6718612pld.124.2023.12.11.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:41:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Dec 2023 06:41:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Aleksa Savic <savicaleksa83@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: Add driver for Gigabyte AORUS Waterforce AIO
 coolers
Message-ID: <10044dce-8416-405f-a525-f547d48411f2@roeck-us.net>
References: <20231207122402.107032-1-savicaleksa83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207122402.107032-1-savicaleksa83@gmail.com>

On Thu, Dec 07, 2023 at 01:23:59PM +0100, Aleksa Savic wrote:
> This driver exposes hardware sensors of the Gigabyte AORUS Waterforce
> all-in-one CPU liquid coolers, which communicate through a proprietary
> USB HID protocol. Report offsets were initially discovered in [1] and
> confirmed by me on a Waterforce X240 by observing the sent reports from
> the official software.
> 
> Available sensors are pump and fan speed in RPM, as well as coolant
> temperature. Also available through debugfs is the firmware version.
> 
> Attaching a fan is optional and allows it to be controlled from the
> device. If it's not connected, the fan-related sensors will report
> zeroes.
> 
> The addressable RGB LEDs and LCD screen are not supported in this
> driver and should be controlled through userspace tools.
> 
> [1]: https://github.com/liquidctl/liquidctl/issues/167
> 
> Signed-off-by: Aleksa Savic <savicaleksa83@gmail.com>

Applied.

Thanks,
Guenter
