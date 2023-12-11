Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b62EpURe"
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB6BAEA;
	Mon, 11 Dec 2023 07:36:53 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-289d988a947so3208760a91.0;
        Mon, 11 Dec 2023 07:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702309013; x=1702913813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USiT5zfWilvoWlYRpLxV0vec/h5b4ak4/V2ZKe4xVlU=;
        b=b62EpURe3zNDPlAAm0F5wmAktCroF8e3pe5hVUub3eSPDAWySVzj9wxJsD1tZ5rJLy
         EL44PIqdMurmRKdiB5SH0fKRxdyjxsrqJ/bMLIk+oLWr+8VqIiyx5jHK3MDnuJ/Z1jcK
         r5B2opYAiIsUwz84NCjCQ1hHjCRgfZjccU0xBTCKAqrZB7lDGj3rQ5KTBx9H8ahdRyp5
         F54jsh841wnuLw9vj7eClpMS1s0e4mq6CMTNh+tuukJPQkNB8Xov/rtfxyLg3xRILy8z
         s09M3X1y5SQiXde/U+A3IdnmnfIUp9UqWFOsoRWcyXLyWUwBVw0xAfSOerfPtpdpa1k7
         vhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309013; x=1702913813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USiT5zfWilvoWlYRpLxV0vec/h5b4ak4/V2ZKe4xVlU=;
        b=E0qV9EZ3Lzzhm4kMnq3u99OqKngd8LMjq1ZkbygI6aYtyOZIodsgQFPeoBqKk9ffb0
         dSxr007qtSrSJWofnMG8x1cQS2x6wNAzpBLR5Lyeoizad9l4L0d+C9fvBqbwrK0m0cQN
         xXF/V4U1Hs9Td74bTLdKkMDYY32yG326wQXMK/NsdfxwutMn/cGz2D7YrjqwvUEX0cly
         jCsbhIhldEJgs7XKvFled2ntRPpnkJYNy72JE7zkDNciQ/qzFPW+m/kW//NcQqHis3I4
         IA54uCSU/kYfnGkE257CJoceUN5Wo8SO8mQaSTNKBj1aqy9D61Zrn6eBg6pvRWbiKM0c
         fhww==
X-Gm-Message-State: AOJu0YxH/L0o/6BdYVc/iSOkQFXRcRpuR1ofXLSwOaHVtxKAG2Ntp6O1
	8S3N3qXUY8fplc0tikI0o7o=
X-Google-Smtp-Source: AGHT+IFrEVKWi+zYA8gCfiKXv8HpzXw6apf0j+ypYDF+rHce9v4xF3sSLkbrymdGw3rd6aJuBljing==
X-Received: by 2002:a17:90b:4c0d:b0:286:6cc1:2cbd with SMTP id na13-20020a17090b4c0d00b002866cc12cbdmr2207441pjb.71.1702309013269;
        Mon, 11 Dec 2023 07:36:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b1-20020a170902d30100b001cf96a0e4e6sm6793789plc.242.2023.12.11.07.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:36:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Dec 2023 07:36:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <a0eb6cb4-b8af-4a6f-8888-fa18f8f1d188@roeck-us.net>
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
> +

> +power1_good		Power considered good

I really don't like this attribute. Like the ones below it is non-standard
and invisible for standard applications. On top of that, I think it isn't
really related to "power" but to the output voltage. What does it actually
report that isn't included in the FET faults ?


> +fet_short_fault		FET short alarm
> +fet_bad_fault		FET bad alarm

Those attributes have little value since they are not standard attributes
and won't be seen by standard applications. On top of that, it is not clear
(not documented) what the attribute actually reports. I assume it is
associated with the output voltage, i.e., in0, but that is just an
assumption.

What do you think about introducing a standard inX_fault attribute ?
It would not be as specific as short/bad, but I think it would be more
useful and we could add it to the ABI.

> +fault_logs_reset	Clears all the Logged Faults

What exactly does that do that is user visible ?

Thanks,
Guenter
