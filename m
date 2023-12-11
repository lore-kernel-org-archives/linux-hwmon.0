Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHYnZp1C"
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43559A1;
	Mon, 11 Dec 2023 07:41:41 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-286e05d9408so3466486a91.1;
        Mon, 11 Dec 2023 07:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702309301; x=1702914101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rkgj0xsJjNUuqRFvrTNXcjbvl2FdG5FGdJNlXw/A8P4=;
        b=EHYnZp1CNmEqN2RE3JJf6mN94RxLmS1QmvLCg3HBlRf9eTKryD4dH+mLfuj/x1WvxX
         umwPedZ8A3RVnzKT/mBwdN9KbWCMOUeUP0Zm8dduZHjCVxSwdr/Kx70nKW8vNCaevXeS
         FK1fMoEEy0y5w3a/hyhqTJc4XS8nrc4N6UT1xf0IPdNcvMH6QqUmik6xbccKEbrmCZVx
         NBnBpBUx+UWpMM4E4rCcGCIT/BDmmHTYWJ73r1wdcJSL8Y+POCTaX4lgHiOuQ0M73ut+
         rAkvVgZkD7oeSPsNbJeB9w4rr3oRppuu/QPM2JAlYVpjUvr76/eLVGqhVps5ge8VchVF
         IXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309301; x=1702914101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rkgj0xsJjNUuqRFvrTNXcjbvl2FdG5FGdJNlXw/A8P4=;
        b=tWEEHeDaGXJhZIH4fEZZEgyNA1KQ36/90I7Rce2q5TwEEUQnlf60B+VSDCtYGlRVjc
         zyRX2cPnkFuDv0nJjddJdAYile48Y6tGX0HiKJiGMRb+cAyCiqPRYganwYun54qWQt3b
         TWl0xEcUFyTMPjNp1J8QFnUrqP43YxOtlNUKZ6y4Pm4//2c5AzooYuWIskCluGUQMUxL
         ZPaqioKswrBH2HoIobUyj78F/AUvAh87hINydrEmZX8ghI7KVU+iTE5obtYwcyMRS/kU
         wmKf0f7Is0tOTATmqhxq7kcP1vJ70Cfau6vd5J4II2G8fo15w5VU+3qZPlU6tgAIqIEV
         rCzw==
X-Gm-Message-State: AOJu0YxDbpeL89WsudSvd5v8qyZRSS2ezuE6im/2QC9HwWwfjiELdY76
	pFpfP6kZApEHFxbvylNXzv8=
X-Google-Smtp-Source: AGHT+IHXuif/A5CNnn4PFgEgh9sAzp142sXqPe6a/S2uXXB5rfBMamdlf3zyD2imWY7HBVwmSAYB7Q==
X-Received: by 2002:a17:90b:4f88:b0:286:f66a:973b with SMTP id qe8-20020a17090b4f8800b00286f66a973bmr4636263pjb.48.1702309300547;
        Mon, 11 Dec 2023 07:41:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id qc9-20020a17090b288900b00286be9fb3fdsm7234032pjb.40.2023.12.11.07.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:41:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Dec 2023 07:41:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <7a6a0517-47f8-47df-9e61-44adb60f6135@roeck-us.net>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
 <20231205-ltc4282-support-v3-2-e0877b281bc2@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205-ltc4282-support-v3-2-e0877b281bc2@analog.com>

On Tue, Dec 05, 2023 at 04:22:56PM +0100, Nuno Sa via B4 Relay wrote:
> From: Nuno Sa <nuno.sa@analog.com>
> 
> The LTC4282 hot swap controller allows a board to be safely inserted and
> removed from a live backplane. Using one or more external N-channel pass
> transistors, board supply voltage and inrush current are ramped up at an
> adjustable rate. An I2C interface and onboard ADC allows for monitoring
> of board current, voltage, power, energy and fault status.
> 
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
[ ... ]

> +/* power1_fault */
> +static SENSOR_DEVICE_ATTR_RO(power1_good, ltc4282_status,
> +			     LTC4282_POWER_GOOD_MASK);
> +/* FET faults */
> +static SENSOR_DEVICE_ATTR_RO(fet_short_fault, ltc4282_status,
> +			     LTC4282_FET_SHORT_MASK);
> +static SENSOR_DEVICE_ATTR_RO(fet_bad_fault, ltc4282_status,
> +			     LTC4282_FET_BAD_STATUS_MASK);
> +/*
> + * Fault log failures. These faults might be important in systems where
> + * auto-retry is not enabled since they will cause the part to latch off until
> + * they are cleared. Typically that happens when the system admin is close
> + * enough so he can check what happened and manually clear the faults. Hence, we
> + * provide an attribute to clear all fauls at once while still capable of
> + * checking individual faults in debugfs.
> + */
> +static SENSOR_DEVICE_ATTR_WO(fault_logs_reset, ltc4282_clear_faults, 0);
> +
> +static struct attribute *ltc4282_attrs[] = {
> +	&sensor_dev_attr_energy1_input.dev_attr.attr,
> +	&sensor_dev_attr_power1_good.dev_attr.attr,
> +	&sensor_dev_attr_fet_bad_fault.dev_attr.attr,
> +	&sensor_dev_attr_fet_short_fault.dev_attr.attr,
> +	&sensor_dev_attr_fault_logs_reset.dev_attr.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(ltc4282);
> +

Ah, now I see what those are for. Please move all but energy1_input
to debugfs, including clearing the faults.

Thanks,
Guenter
