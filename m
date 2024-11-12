Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF3F20B1FE
	for <linux-hwmon@vger.kernel.org>; Tue, 12 Nov 2024 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397327; cv=none; b=Zx3Z35YR2lhowj8nCeHZ/b9BKATrLP6imhbBtQmQMeLMSXXOGtAu91CyDWhQRGU1aZaoSHBbJj9hqgUtXF5Pq5v7n8Kx8EuvttVLrBXaQEl5c3cAojjAEzxtbmosOOvfCDKFLxeS7wfIpA+ll0CW8vDp2imAFv6iGannw2KyLmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397327; c=relaxed/simple;
	bh=4Zdw5kgKTgwPsGUNYQa35eedlMhMIviirI6Hy+Sd0hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwhKhn+rERDBzKoeXSVo0N/p9rZaoNqrIMHi+P3WDM4T2c+XKKFO46XtV6EorGrJI4XwrhViPg9GpxtMYYSCjIUyukoEVekwHASH/IvXNh2c1U2st5tztQanWaD8Si0fWqgQkN8TL9qUDm3qjBvo1hKZdBfEZnZ/DXfaj82tlDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j25MIWdG; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j25MIWdG"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7181885ac34so3413811a34.3
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Nov 2024 23:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731397325; x=1732002125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mWb+6hjmOAxlNgDc7JKg2yzzLTEdqJ06FfSb5owKkeM=;
        b=j25MIWdGoDvIVyDNgln+5npG/TeLmJHE8O3Qcv1StG5nkKn1moyBgKUYigN6TNkXod
         9tEaLdyrKhebdGgw/jTwYyWvSREapa1is/A2o3vq97DoGNC06WM7h8Y/09Rdj6WS5UmD
         +cRi9NlMwf1M3R8bNsq8eiRjeXPItW+fcJkkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731397325; x=1732002125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWb+6hjmOAxlNgDc7JKg2yzzLTEdqJ06FfSb5owKkeM=;
        b=ckQf12fmhtA7sE/1a/pVdYIr6hy9zw8nTQR2hksVbvbTNB8hY3Ansvx9COJuIqnF1E
         RdRz5OeIuKd61aaXc3Yo6Rdl5WOoNUb9hgYRaVXcDplmOQaaHYyV+ZJ66yz/iy0bnZuv
         rS51rQ52urD7hY+/41VQXU4Oax5D1b6XrmrwxWXPPwyL+EVCcXzOuUENd6JLiTtqaxx7
         2uSKrNxx69+jqdRsQdKM1R5pNI6gjWoZ8a2ktgBXEiY1opAWBrSuGFSTDK7EQNw3gDVj
         IT+u1qyLPIae41IHXrpYwtI4eoDBJn2owKd1TJ5S6d0s7oMnfyh84fWWRVq60E0gtRRh
         ihew==
X-Forwarded-Encrypted: i=1; AJvYcCWV7aYpg5EI8jaC4zB9fvkhFBDH6M+HPtbgcehkz7Bo8lJeZuLKTpnFvXf5NsbBtiefV5vFCR+yA9ZQrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVwYnhfaqGBs0viIU0HLDokLVby9MAGUFJeAsfKcw2oZ2fJ48v
	KUPO/AFqygGYFwmzeo6xZJyyZN8o43Ds10v5GvvId39i26AKemjrtph4SqJc9w==
X-Google-Smtp-Source: AGHT+IHAivkem+e7/fcFL3MNsRfeSzjTTUbqrvF8zF3iiVeiJL0WKCuRtYmXL80k54VkCTs+Wi5+3g==
X-Received: by 2002:a05:6830:1050:b0:71a:21c9:cd82 with SMTP id 46e09a7af769-71a21c9d013mr9830707a34.0.1731397325430;
        Mon, 11 Nov 2024 23:42:05 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:7cd:9f36:34ae:c525])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f67f079sm9823430a12.85.2024.11.11.23.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 23:42:04 -0800 (PST)
Date: Tue, 12 Nov 2024 15:42:01 +0800
From: "Sung-Chi, Li" <lschyi@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (cros_ec) register thermal sensors to thermal
 framework
Message-ID: <ZzMGyaBGX-yLZs8B@google.com>
References: <20241111074904.1059268-1-lschyi@chromium.org>
 <20241111095045.1218986-1-lschyi@chromium.org>
 <4cb3b1c7-86fa-4344-a413-031723f31f1d@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cb3b1c7-86fa-4344-a413-031723f31f1d@roeck-us.net>

On Mon, Nov 11, 2024 at 09:01:33AM -0800, Guenter Roeck wrote:
> On 11/11/24 01:50, Sung-Chi wrote:
> > From: "Sung-Chi, Li" <lschyi@chromium.org>
> > 
> > cros_ec hwmon driver probes available thermal sensors when probing the
> > driver.  Register these thermal sensors to the thermal framework, such
> > that thermal framework can adopt these sensors as well.
> > 
> > To make cros_ec registrable to thermal framework, the cros_ec dts need
> > the corresponding changes:
> > 
> > &cros_ec {
> > 	#thermal-sensor-cells = <1>;
> > };
> > 
> > Change-Id: I29b638427c715cb44391496881fc61ad53abccaf
> 
> Drop.
> 
> > Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>
> 
> Detailed explanation will be needed: Why not use HWMON_C_REGISTER_TZ ?
> Unless I am missing something, this code just duplicates code from the hwmon core.
> 
> Please do not send follow-up patch series as response to previous ones.
> 
> Guenter
> 

Hi, thank you for pointing out using HWMON_C_REGISTER_TZ. After checking how
HWMON_C_REGSITER_TZ works, I think I only need to add one line into the
cros_ec_hwmon_info, and almost all concerns Thomas pointed out in latest reply
would be resolved automatically (because there would be only one line of change,
and that change is just a hwmon configuration, so should be a valid way of
combining with the thermal system).

Thank all for reviewing and giving inputs, and I will soon send out the one
line patch.

Best,
Sung-Chi, Li
