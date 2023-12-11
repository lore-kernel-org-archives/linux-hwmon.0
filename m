Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9xsisik"
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134B6D68;
	Mon, 11 Dec 2023 06:08:26 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d0897e99e0so25238275ad.3;
        Mon, 11 Dec 2023 06:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702303705; x=1702908505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SA/gWEJ70l496ZRPZ8Gq6NqqTI/TZ5zOjo1CG3aNWQk=;
        b=Q9xsisik4dyxNQJT3GzVZx1Hbb3csEMO8mB1bykDgG0D8cJ3rkGbuRs5xNYLKNMvDD
         OiAjWprq6qV7ipgFY8KdiKLQx7cfkZxNVtrlgikvXLAk0K4ReQIUMHGrBH3YqDpWkxAX
         4ChwWHxX3Uv5rgldwNyuyY7B/7I21hCNT5g6pIhRUMGpTMV1HGwDIW/OrsHjffCFedLP
         T1adQ+XYM2TOGh+Hkh6UzozpJTrjc9bvkPz4kuMkUnOBH6+5pkM49dp5q/kS95Kp8wr3
         r1A4VnpAkPxslkh0+UM+JlfYdwVBp3JR3zUs89Dr8Qa9McCkR1Sx6Ve98h93QwyiHZK7
         guGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702303705; x=1702908505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SA/gWEJ70l496ZRPZ8Gq6NqqTI/TZ5zOjo1CG3aNWQk=;
        b=No2ICBgwpkDHlm/t61APqxKrhbvZ0y9N60ysNRztolI3LyOXICXB35PmbAouWLMlhh
         ChObXdulQJodKjUg6WLANNDqgNL3vR1PYO5YJGytUrYpXMJmLvDOl1JF2hZ1fTi99iS1
         yTDUIdWCV43gymzhpIX0/+hxZ0QvZEzjHGmAKU5qFxPYyaRvWoddy+2h/CmySfZsWq2/
         JKm8APQj4UnhLvbV8PaKX9CbKbXI7wg/TXpAooRP1J4HDlL5A9KIkk8yBZDpNsUKH+Ub
         g3JUjvohj1zdiQPXHj9kzQCCSgpW9fHC1+L0b6NIeeiPP3VLOu6zLGSl/5+MvQLzA2e+
         QHTg==
X-Gm-Message-State: AOJu0YxRXSwaeV/skJoCgaXdm8bbsEokQyPG86M/hsTgRi3OdVJNkAqo
	aKhw0m4IZBJLzconeH0VgHs=
X-Google-Smtp-Source: AGHT+IGDcZb85iygTV3TyMJjWVksVAZna//2oldQ/wT2yJQBkQFQjIaE0S8zla33N9vUr227Mm9w0g==
X-Received: by 2002:a17:903:25c2:b0:1d0:9c97:6fed with SMTP id jc2-20020a17090325c200b001d09c976fedmr1714985plb.44.1702303705301;
        Mon, 11 Dec 2023 06:08:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902680800b001c736b0037fsm6835239plk.231.2023.12.11.06.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:08:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Dec 2023 06:08:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Zachmann <mail@mariuszachmann.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	jdelvare@suse.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] hwmon: corsair-cpro: use NULL instead of 0
Message-ID: <5872278a-32e5-426a-8c3c-f8e7cfc42901@roeck-us.net>
References: <20231210220357.77036-1-mail@mariuszachmann.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231210220357.77036-1-mail@mariuszachmann.de>

On Sun, Dec 10, 2023 at 11:03:57PM +0100, Marius Zachmann wrote:
> Replaces the integer 0 with NULL.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312100455.k6m2eO4N-lkp@intel.com/
> Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/corsair-cpro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> index 463ab4296ede..a284a02839fb 100644
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -524,7 +524,7 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	if (ret)
>  		goto out_hw_close;
>  	ccp->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
> -							 ccp, &ccp_chip_info, 0);
> +							 ccp, &ccp_chip_info, NULL);
>  	if (IS_ERR(ccp->hwmon_dev)) {
>  		ret = PTR_ERR(ccp->hwmon_dev);
>  		goto out_hw_close;
