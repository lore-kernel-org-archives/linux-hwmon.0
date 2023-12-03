Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrkCvPot"
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC092EA;
	Sun,  3 Dec 2023 09:11:40 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d880219f01so149605a34.0;
        Sun, 03 Dec 2023 09:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701623500; x=1702228300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2egft6ySmqioxdZtumOqW29hb5JsXROm0aRahntdqg=;
        b=SrkCvPot0xNiz1D6lmw2rhqMLzMFMraT8XLVOAhqN9OHByE+IHEw48YhrFJ5QmBt/5
         RkCE4QNGwgFQRlfvFAIedjqvbNqHDQHcYmJ01ZYnM+7MokDO/oMC77KqVmkCDcKgHIUA
         tooD8nPQsMqdLuGWwY2DDyXR0M1GJmr852gbpxvKDphc3QzK4a7Z6m2VM3GiwVjfjp5a
         a1IfMQcZAN1MfaDutXiDLCkvtjs9oAhTIYLrV05mpWjdcfQxSljOi+Ia9bVIVjFUVOWX
         2Wnh56SM1s24NxzjW+JamgauiWg0UYWN9xHln+9TQTfDR1VtGm83v/POZT+j3uYl6VRC
         rcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701623500; x=1702228300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2egft6ySmqioxdZtumOqW29hb5JsXROm0aRahntdqg=;
        b=VpsnaijCefwKUtMYJJJSMaG7UlsgQqjdAKdS81+mZijK6W13r89zLdem38RWSwNVQm
         CqybdypSAsvYLNtAt+nDKlC0n6Kz7sEbpHu+0KZngGKT9zJuD1r8JxxX3zNjkp0x+aMc
         3KzDgw6+aKdfT0NJ+ntyhJ/XXenk9goZnTsBTsRhDoG1D7G+TQN8+p2PQpsBN/tmk2jL
         l3un82RY0fnIgw6kGq9YotJu0GE1H6DRlSwGH5iW1dJdtY9OGSqUBlVYB3zStmcUH07d
         uGz2qKYYiLMFIWJWjfo+IglQiJ/uBzowfovu3ljobpAXPTP1hGty/T0bM05vFl4fxzuR
         42KA==
X-Gm-Message-State: AOJu0Yw33PJdm4vcveuvV5aWFVTW6HgwcoeKqNlYDAy6ERxwama81fD+
	ah4u3tDzKr93WFgfpImw5ZtYtSh/UCs=
X-Google-Smtp-Source: AGHT+IH6L1b1nzjlZLruMja918gC8RF9wT6h86C+qDRf3PJleoNUrb+2weIQYdvYwpoFO05ngxoVbg==
X-Received: by 2002:a05:6870:e86:b0:1fa:f177:625b with SMTP id mm6-20020a0568700e8600b001faf177625bmr1051041oab.8.1701623500073;
        Sun, 03 Dec 2023 09:11:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id wc12-20020a056871a50c00b001fa3c734bc5sm2193237oab.46.2023.12.03.09.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 09:11:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 3 Dec 2023 09:11:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jonas Malaco <jonas@protocubo.io>, Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: nzxt: Fix some error handling path in
 kraken2_probe()
Message-ID: <18eb73c8-5fee-4b3d-8a74-54bedef487e1@roeck-us.net>
References: <a768e69851a07a1f4e29f270f4e2559063f07343.1701617030.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a768e69851a07a1f4e29f270f4e2559063f07343.1701617030.git.christophe.jaillet@wanadoo.fr>

On Sun, Dec 03, 2023 at 04:24:05PM +0100, Christophe JAILLET wrote:
> There is no point in calling hid_hw_stop() if hid_hw_start() has failed.
> There is no point in calling hid_hw_close() if hid_hw_open() has failed.
> 
> Update the error handling path accordingly.
> 
> Fixes: 82e3430dfa8c ("hwmon: add driver for NZXT Kraken X42/X52/X62/X72")
> Reported-by: Aleksa Savic <savicaleksa83@gmail.com>
> Closes: https://lore.kernel.org/all/121470f0-6c1f-418a-844c-7ec2e8a54b8e@gmail.com/
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Jonas Malaco <jonas@protocubo.io>

Applied.

> ---
> Closes added to please checkpatch, not sure if relevant here.

One of the few checkpatch warnings which may be ignored for hwmon patches.
Sometimes there _is_ no report of a problem or, like in this case, it is
reported in some unrelated exchange. I don't drop it if provided, but I
don't require it either.

Guenter
