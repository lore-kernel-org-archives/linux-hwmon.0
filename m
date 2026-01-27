Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3911A9F93
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 00:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473502; cv=none; b=CddKiroOo6o8U4MaC5HC579t09ar8G9EmLRCsJ1yzfgVc8sXgIwnhNqT+DGapay1/FHId3Ghjld/Eyg9I/Cp4KOjkifq+omgIcI7PY4g/mxDPJJToB1m89JfpQZy2S0k/HA9AIzlivApOOzfJXtSmut/obWt1xKifuewTDsNppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473502; c=relaxed/simple;
	bh=rmQIko+hNFaIJSkG88eILSSlkJFZkBF7X5UpMK5l3Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz4F+SqDnafKXhu7PLj9hFdO9AR+QbmW9y6+ICtxHcXcuu3osK7ZRDumEwZAYSd/m87dlmUbthy/3f4zp0jQ50q/iuF7x1y8pc46/P92K6gwRF32K1HxpbFsh97t2/wGZ2sHUULgbCj6FT1Y8qLQ91jpCHZowJiUUKzu0zOE0ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKH359aF; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKH359aF"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81f4e136481so2534345b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 16:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473500; x=1770078300; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62rwDCz8UGjVLmBZhM+IIc4DKJxP95Zzwu51NkV7SQs=;
        b=BKH359aFI+BQCUMCRlTVuJ+zFfDs8WEuSMZxUKOlmcAbPRoOgbGbKm5KyGchNkVw68
         O4YoAP5tWUQPSVzCROVrF9wWb06EyFCaWb4Ai/D1LsnkSugUZKoUblD0BdL1jn7xHsgI
         mM0nGdeENMWeJnpUfwx9FrwSZucukb1eVPZ4W6PFJRjQd7v9jafhcaVoG4W846hgO1R1
         ts86NFtdzD2IQINf1ihjNNg81V8svc+LhBY7Bs1Af/VueCNwBgxZ1CmZD9J4WkY5bxqx
         2ImkDvNCELT7DRFKltImIwjCYgir3NY8Rxh4WVzoJqm6j4vqTlLkHKhqgf/NabqTN28f
         q9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473500; x=1770078300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62rwDCz8UGjVLmBZhM+IIc4DKJxP95Zzwu51NkV7SQs=;
        b=AQw3VD5rzwZgqwsMAA2n7p30sBSQIVs0ur3dmMOYJApH7BiPQ2qWy+zstmGg4CBR54
         zxVGyv+CsofEFrEfC1QFdKGymOwNBBX097J2C3VabE0GDr/cgBMBHUvoF9D2TomrOjUX
         uRlvo2ex9zE3HYqeNxbBAjCDa/T5crWQ5y8n8ByAstMXQefdEz+mYrgw7lBukhIhiFP5
         vTvSWZPBL3zZXyb2GW1KoLWGUlITUSA+nNllIbwMhw/gLPsMk3D7kehuT4gfH5sPO8xQ
         HhnnZQtAH4VqamHenhfGgLLxFp6nqU3Swt+xsgwms+FfdowkHx52dw0srUDEMFqmx+EU
         oznQ==
X-Forwarded-Encrypted: i=1; AJvYcCU56wYVzepkEb7/oijnI+3nTd+hf+oZMPBz/NJor0qEGANiqOi2PFIAgv/U2tmEWdhbyOOfrJkgXDiSjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywaCyj6ockT0faL/vFNum5h2uZ1eY48zR3aHikH1WopcbES81O
	RqEk7TtNysljuG1AMPJJGbCtBGUUhNJk9QPgpdihdZgaBwav48vSHxWf
X-Gm-Gg: AZuq6aKx7aFq/0dloVBW0d6Q4O+uPRnqaPcS834JiHika3kzff6nNOYiMnZ84Pcl4BY
	lHYDPE4THmgW64Ry5Vod/NJSNTNiCod4GEwavVwxioP8UyyaflwQXjmksGZq7Zajc74DlqFRoZd
	QUUnSBip9HSDkJZsM55HY9AMNfXg4u7GdQV1o5Zb5byLFAchBjOIZphLBIYZ+kQsPkyhZbcqMgp
	C6jbn1kGg9s8xqqESihvvlHx8FEiFqd6C9sGVQmSbI3cSSfX2uBEuGFuYlnQIk7t/MR6djG/deo
	VoCLFj5PksWqGDisX7ZSVqlFz17prS1gYXslAadrFADU5mTkUhynYvjD5a58PqSoNnXB4MkZvBp
	mP/9QZ8DI9sIlH3ojVRhNOWzpZpre54+jTEvKQbyOpLsaVIQCAyPGWbDApQ3ntj8miCrY7y9g1g
	zpHGX7NyZPjKKL2DZqP3VwUo41z0A/cdOGKk8=
X-Received: by 2002:a05:6a20:2443:b0:387:5daf:b310 with SMTP id adf61e73a8af0-38e9f2569d0mr4995496637.74.1769473500232;
        Mon, 26 Jan 2026 16:25:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a142e5asm9250970a12.12.2026.01.26.16.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:24:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:24:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (cros_ec) Move temperature channel params
 to a macro
Message-ID: <5d540b6c-1c7c-45d6-bc72-b6b1bc3a4b9c@roeck-us.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-3-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-3-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:57AM +0100, Thomas Weiﬂschuh wrote:
> An upcoming change will add more channel parameters.
> This leads to a lot of churn and very long lines.
> 
> Use a macro to encapsulate all of the shared values.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
