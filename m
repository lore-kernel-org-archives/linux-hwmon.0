Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714EE3659EE
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 00:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774140477; cv=none; b=iAIBMqaFo2LUx0URLiR+w0+sspRYTprWb0B762gBpxuUeg/IlXoLdxL44CIA2/3zrbJO/o59GTdNFZUTrzgI+zXOI84MkGRoMbhp/ew8ne8KF1JLjkp1h0C5xWolliMxhmHSV9/TsS9AZzx3+q4HLfQte4hi3O+rESECRGatbMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774140477; c=relaxed/simple;
	bh=L8rI2/+IQg3Kb5XTIfe+zqxOjQgzl1YYP1P2kpUiY4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQ5I39Vc+bLTVCmvFbBLjZUMY5ltEl78tDASKdfWgEDl2fNGcRxN2WKoD6AlcGIfozELb/xOkiTgpgq0lXcU1Zz9Ls5m7FOBs6GhwRxBA2UyY2wHamnCYVKewq5ob2jyNtEkhUUdNFLPydzjvoZR6EniKNMYsX/21Sqh3f4no1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXhztz8h; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXhztz8h"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4016655eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 17:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774140476; x=1774745276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmOmYTUYL29ZmhGVfRfUuu5nu0M284kaXyHuUr81jcw=;
        b=KXhztz8hIfJi8veMsCibH+O6LCuzdO2/+tuIY0iGmtiWcUK8P06HB41dz6DHLvN3sQ
         aNiq5BAvDiuk/XWbYopqs5pccR7XKhA4h9MV0lS9svPzS5Cx5yU6DRtPf3tVr6IRIIQc
         q8+H+Y4JsdYZ9R6/BfYvBHYr2J/q5Dd856TTKmOTjB4cLgn6Pg4iOvmRR77GJRAofM2V
         DkqcSRPYU1Mae/cQ+AB+NfBznhjp7Tdu7AqEwHLcxs0bQQlv26zoAVq0KYMsGuL2bno+
         1Ot27WEE0X3BIGBGfIFPW0V+IAC/Xp9f6yFNNHKCOO39CF/PzQDc2ZZS9wWRnZ0F5D/A
         /FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774140476; x=1774745276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nmOmYTUYL29ZmhGVfRfUuu5nu0M284kaXyHuUr81jcw=;
        b=soQrYBjqhunm1Xyzt8h6b+zHfJIPLKs79WTChz52u9JVZh1zv1QABOoln2O2+FIg4L
         S7HxBT2VXX1qGB0LkWWlFQaI23XH9EIy0poMRHxfwwwyC893emuBzbkD0LAVurZBrk5a
         RatRBewkErhL7CsDBCxFwF6z4d2hwNFyy3M2twHvQNGv5ZrF1LYYdeTIFJZmP/roa/Yb
         dbGqax+o4YTeXXFWtG/aEMXe4OI5/WS3gc2kAzeIOCTR4CdsEvYVpxWWlnKcU+ZnNzeN
         F8NTvLkXu4B2LOQRXwbrhZQdkdFfzHfAUZcbIVLJmgVNM41sWCGeQDxVHoY9EAvDdziK
         8ryQ==
X-Gm-Message-State: AOJu0YwXnNrAiRBMmblDnwwvD91kZvxsViXJ8+xd++Obg5TKFIDJThAA
	8JJJUjCk0qWC+wNt/zNOipZ4TZhfmAjbLsHmtNdsiHC/5rgQGVtBShpj
X-Gm-Gg: ATEYQzyZo7uKTjaf7RGSJV1f7qwhfZWcMan5mfxSCJQow617IlZ7jI48ArEBi5wgUoC
	IAWDs8vVocoNn1Dz6tTr1QB05UwG03batOCTzOsdQH8AbZ2iE35Ynp7rMgj4KTBEEcEOhay38ZW
	Vfw/LOEyqrIViJNGDPMVUYub082/pfwFM6ZU7QaiSLMpw4gS+XYOTXzJxNIiz5NJqbCCjElN0hv
	0ODgCd94rxHiwMezpw7u6sJjAh2eNVuOnTDIaa2xnJCwYqZ6PqEytd+HLc4xHrPMldEcHxoysWD
	INBdkru7Z8RisiVvW3lBhE+99tY4SqJwtd7RfQt5OgbXk+QSHFHYqquL5IyYYcJhYXd9IHVmlJA
	i5vuPuTgbH9+Irvj/NSG7EAo5xYYDbuItPqCMR2BLmJgucS44L7XysrhQdvFc8mVmrS///9ZpuV
	7fCJoAxKePLFCGe98RsqmmQDcMfyINuKJ7nVwPfhd4PUG/O7M=
X-Received: by 2002:a05:7300:5721:b0:2b7:a27f:3a6a with SMTP id 5a478bee46e88-2c109566b73mr3484891eec.4.1774140475574;
        Sat, 21 Mar 2026 17:47:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2e6c30sm8200248eec.25.2026.03.21.17.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 17:47:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 21 Mar 2026 17:47:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v6 2/3] hwmon: (pmbus/max31785) use access_delay for
 PMBus-mediated accesses
Message-ID: <b2e9ff2c-659a-4658-a393-9e283795f7b4@roeck-us.net>
References: <20260321181052.27129-1-sanman.pradhan@hpe.com>
 <20260321181052.27129-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321181052.27129-3-sanman.pradhan@hpe.com>

On Sat, Mar 21, 2026 at 06:11:47PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The MAX31785 driver currently uses driver-local wrappers around PMBus
> core accesses to enforce a 250us inter-access delay needed to work
> around occasional NACKs from the device. This duplicates the PMBus
> core delay mechanism already provided by pmbus_driver_info.access_delay
> and adds unnecessary complexity.
> 
> Replace the PMBus wrapper approach with access_delay for normal
> PMBus-mediated accesses, while keeping the minimal local delay handling
> needed for raw pre-probe SMBus operations.
> 
> For the raw i2c_transfer() long-read path, use pmbus_wait() and
> pmbus_update_ts() to keep the PMBus core timing state consistent with
> the raw transfer.
> 
> Also:
> - allow PMBUS_FAN_CONFIG_12 physical-page accesses to fall back to the
>   PMBus core, while remapping only virtual pages
> - use pmbus_update_fan() directly for fan configuration updates
> - use the delayed raw read helper for MFR_REVISION during probe
> - add a final max31785_wait() before pmbus_do_probe() to bridge the
>   timing gap between pre-probe accesses and PMBus core registration
> - rename 'virtual' to 'vpage', 'driver_data' to 'data', and drop the
>   unused to_max31785_data() macro
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
