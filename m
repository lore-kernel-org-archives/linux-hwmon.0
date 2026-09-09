Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6DC3515D6
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986271; cv=none; b=Q6pHg0w6Knm5rD+1WqsqRYL7alu0aWsF7sUVvAsZntffF7ggi6guV/Zv6cyns7+e/ToGObDv0SnOK0KGrh2qOnzU4E/7Y2GjqRKiwmbiiPLocG/JbanUI91BhbnKruwD2dIcxw1Ek+ODvo+AxGawetO8bfBkDbbqeCxro27Mapc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986271; c=relaxed/simple;
	bh=5Hm9gfjEI1Q2doQp1W1IdtzLqqaU+0usRSw9PAqTEB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3eaMxEdf5EZOUkIr2/X+NF2fx3KUn/lBHFlM6XX5d0klU3bMcnwAALhFCXrPEXBVO6qFEE94ax/wosdOTOTyfAWDapXs1hJYVrKVk0RI4Zbon4oXmPDTOiL4iLwOIsGRYoAdwBpT5VMzE3tfZ+gH7lKZjDNbcF3lYIsDo0BmyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEjEpjaf; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEjEpjaf"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so601785a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2026 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986264; x=1789591064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8ck0b/tvXvZ/1fxlfkYlwHFNSdW5hjtPnNTOS43Hbuw=;
        b=eEjEpjafyAx0EMcn7QDeHBJvrqY9VpJoVW/oCyJB/ptPlt3+pg/OIEoID3hJId/mQO
         2epXyGjI2Wq0T6012WCjZUMfWA30/GHqT+2mTZq7th0PvA+UQnVJ0h9MCPPtvICRESl0
         ruM48B/BBD1ja8Hf6I4J2TaucDGpv8fLf/cj9OZOlnPXr3nv7yXIaui/yL/7CjRHIQ1T
         7ihsRvWCQkKKXgaWggyIWfVU46H/c2sAXH2FFGchcwBHAYR9X+4ckHaxFMHzZ+4hldSg
         FWS8E5MdmYeo6NY+ZlJqQ7xy0VcyKrq0JRWzMP3Udus+412lVRudkxiSxQJIGH0Xnn/+
         mogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986264; x=1789591064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ck0b/tvXvZ/1fxlfkYlwHFNSdW5hjtPnNTOS43Hbuw=;
        b=mRKfR+3J5f8WDswcph34vq1hjq6amg8Q/04QrbQVS4li3hsnhrLoW3oSa3yJJ1vODY
         lVI947YtFMx3sFpz7i2WE/TjRKMhGsyZmmf+4YAwWXLY7Z9DbqqYtRD8vr23Krqrpz7t
         S1FTTOhkDCMOepNIflzYr551ShjZ7sEM/4DKK3Rcdu4FyemJrh5Y242+OKCQyKMzSrMK
         XeL+bO/fX+TNb6oWGpJdgArTZqcMnH8u7PzfOf9asreXBl5Fj7KFWx3BpW64Uo46Ddo1
         1i6CXhiFb7fmWYIOcnuOw0cINdbiMgNplzdghRWtaP3Q6zvZBmmkyrkBkupbAdlkKRLe
         iSHA==
X-Forwarded-Encrypted: i=1; AKwUvByBFWO2rJCmOkEAwLSwMcanzzoW+nKS1YW3MThEtOCEffZaH2BcU71hUoupTKBnBm7twUpgf17B3DFp+A==@vger.kernel.org
X-Gm-Message-State: AFuF++lKy08KgcRQSjBcvzioEIuyR3JWDp+aKuAWKpdqGKJB5UXgIt2M
	Zp89K5pAub5pEmI7UNAr1F0deIuFhxGDMlIIoRqsdou0TGBxYIZLuGyV
X-Gm-Gg: AYBFou3XDn6tVRf77WpgUb4lqdeQvrXWaD4jVtzofKmCQvdSqAdo5AjAmJqdob421G0
	PgjrQy5yjOnWhfqyaV1M1/WA0pzszhFp/+Nnb4SBRqMjRa7yLll+qHgOtLxhyGG7wVTpH/st7kN
	va0W4vSZj8nrL8j0D0cxM6vSqT2+pnbd6E+UIwCg+9fZyhQyvN0jO5+JOpflcarsv1vlPlbKN7d
	UaMVCiwGEyslz5xbqRe9JXp6Yw9/MHz0Ew7vylOXEcDlGJIDGKnmysiffnbPWdKtDbVOyKTPvN/
	Dxj+2NX+xW5gwjsI3ZEmvz/UzLSuqG1UQs0RkaBOJBRARhf4hVQwWaZoUxCHJzZDaTMWPDCF8Hs
	KI5D7dymFMtImY2Md6HfltVyu9zKImgsi+Bhzdi0J90nX+fPm+ZKkq4EMIw6EFBwlko3n0ZBIiR
	Pa3Dq1cW/gj9kbY2d6a0Od3u2BJiujnq0/hDD3lubBssWMdTbPacyNxklSCFGIlzrWD/oBCjrau
	h0Gy6nSEHkN
X-Received: by 2002:a17:90b:558c:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39d70ae1a5emr4704439a91.13.1788986264483;
        Wed, 09 Sep 2026 13:37:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770bc2e1sm1226801a91.1.2026.09.09.13.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:37:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:37:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: Ming Yu <tmyu0@nuvoton.com>, Ming Yu <a0282524688@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Lee Jones <lee@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6694) do not expose enable on DTIN
 temperature channels
Message-ID: <a9885f92-e54a-42d6-bf96-db2ee819b473@roeck-us.net>
References: <20260803102148.14196-1-ali@iusegentoo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803102148.14196-1-ali@iusegentoo.com>

On Mon, Aug 03, 2026 at 10:21:48AM +0000, Ali Ahmet Memis wrote:
> The driver registers 26 temperature channels, all advertising
> HWMON_T_ENABLE, and indexes the enable bitmap with the raw channel:
> 
> 	data->hwmon_en.tin_en[channel / 8] |= BIT(channel % 8);
> 
> tin_en is two bytes and only covers the 5 THR and 5 TDP channels
> (index 0-9). The 16 DTIN channels (index 10-25) are enabled by the
> firmware and were never meant to carry an enable bit. Because the
> control structure is packed, writing temp17_enable and above indexes
> past tin_en into the fin_en bytes that follow it, so it toggles fan
> enable state instead; nct6694_hwmon_init() then sends the whole
> structure back to the device, and reads report fan state as temperature
> state. It stays within the structure, so this is not a memory safety
> problem, but on a board that uses the fan channels it is not harmless.
> 
> Give the DTIN channels a temperature config without HWMON_T_ENABLE so
> the core never creates their enable attribute. The enable path is then
> reachable only for the first 10 channels, which stay within tin_en, and
> fin_en is left alone. The DTIN input and limit attributes are unchanged.
> 
> Fixes: 197e779d29d8 ("hwmon: Add Nuvoton NCT6694 HWMON support")
> Suggested-by: Ming Yu <tmyu0@nuvoton.com>
> Link: https://lore.kernel.org/all/20260802124730.20387-1-ali@iusegentoo.com/
> Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>

Applied.

Thanks,
Guenter
