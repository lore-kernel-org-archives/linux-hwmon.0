Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdOxduut"
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FEC4D69;
	Sat, 18 Nov 2023 09:46:08 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3b56b618217so1989606b6e.0;
        Sat, 18 Nov 2023 09:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329567; x=1700934367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6C6ab0X+XpV2EOJr7vcq043ghKAsga+tBo9I2zFE+98=;
        b=hdOxduut8FJ/eZVOhn+ecw/G/Fi98D6zjKjYjVDoTUnL1A/r+3VN/goKit1GVhIWHL
         tnpnWIhTXkT6sU/OMNdM3GL6B1WXcTUwnYMF2mjuXEkgSwRMTG1tKnmpam/QcJyB5ar5
         AIJ+2/v5G6XGM3YVJQkTNMUit4Zcb8cCLNojkaRauA3GvtKs1q9LRIpWEI2atMqD0xX4
         cfzRXXgohuFIwWNIl4dXngc6pVuMl2MsrpYU9Eym3kaiRgv6UEPxq7i6/SIsYqIKP2Z0
         VDRzH0Cu7hZXGeUL1uhlIwvV3VP3IwiJNHLdG5mRTbeVLXs8gI8801z6xTI91xSHEmTT
         wJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329567; x=1700934367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6C6ab0X+XpV2EOJr7vcq043ghKAsga+tBo9I2zFE+98=;
        b=dt+DegeZBFFNYL2smrQ4AmsqAiqeNH/FZioHNdVIcD5MV6HZ+7P2rvZbxvUGQkR1B1
         oZbiRyM3DidPqA1qToZXjvSVrjuK0TFcb8nzd3Ci3t4baiFVkn/YRjMw6xfCSSUOQD6z
         e6zbAvPqMnUd70ht77zI7b4XjvyK7Y3yZCRg8fHe273WRSU69IleCKyw/mcfiwOqBfwo
         OQFjKX2I7uZqqqX8v0s9bRlr2OdVMCIc7fagX34POuJNVPP09RIFQT4a9BZ7WB3UGFE7
         U0fLGNdiyDRQeD+ZvrpCHcR+A8zJttDik93EbeJeuxtXf+Dpdalo4OWsh6+rrtULVCAW
         aLew==
X-Gm-Message-State: AOJu0YzFaZFr55XPSnao0I/m8uAXdPsQ9mktUC9CU+yyU98xiNBk+Iiq
	o69L6L6JQwcm/vBDSU8p2WEUO/dCKBo=
X-Google-Smtp-Source: AGHT+IHPM/wI9Ta8+jdkmo/kwMHvjSkUpqckZFVfD55iwLuTfDHXU4K13mcB7ynDdZAmdvf1kQhyTA==
X-Received: by 2002:aca:171a:0:b0:3ae:5bf5:4ad1 with SMTP id j26-20020aca171a000000b003ae5bf54ad1mr3561429oii.33.1700329567422;
        Sat, 18 Nov 2023 09:46:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z21-20020a544595000000b003a9ba396d62sm713645oib.36.2023.11.18.09.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:46:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 18 Nov 2023 09:46:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ABI: sysfs-class-hwmon: document missing humidity
 attributes
Message-ID: <e237813d-2cf3-459d-8047-4389dfb3cef0@roeck-us.net>
References: <20231116-hwmon_abi-v1-0-8bfb7f51145a@gmail.com>
 <20231116-hwmon_abi-v1-2-8bfb7f51145a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116-hwmon_abi-v1-2-8bfb7f51145a@gmail.com>

On Fri, Nov 17, 2023 at 07:40:35AM +0100, Javier Carrasco wrote:
> All these attributes already exist and are used by the hwmon subsystem,
> but they still must be documented.
> 
> The missing attributes are the following:
> - humidityY_alarm
> - humidityY_fault
> - humidityY_label
> - humidityY_max
> - humidityY_max_hyst
> - humidityY_min
> - humidityY_min_hyst
> 
> Add the missing humidity attributes to the ABI documentation according
> to their current usage and access rights in the hwmon subsystem.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied.

Thanks,
Guenter
