Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5D42BEC52
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762908; cv=none; b=SEFMqmhdkfBmacOn5tCK4B7jhVhtu/PE+tc38sm2VZP7mnSzDCNdBs0YjjPfpxr4Y7brYben7yQp2BcvrJSv1EFqJLQ3++uUxotLF3mf+yRdTYZlFt5GutxXZpC7EEELqM9AHOcuzfR747QnzVICnrj7urGvvahZSCSmLJ+7uMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762908; c=relaxed/simple;
	bh=DVl7jLgxMIXSLk+EDXb7k2RJJDz3Mx+eRUZGPcAqzKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBJ1uyHFko84hzu5AAIVg2X172fkDXQD3AM5DZGR/zZhfBivPfV66pWW6rXelKdYko+Pt4Tc+Pa4sS9FWPExpX1QdiEMhZu98V9FJr9FyM5zdvaIpWn5SSxkk3pUzOanajJRDwoWNo6gXvtSHJ7+srxTYrme5cZA/Gf0by0lbsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PucHr8pI; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PucHr8pI"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c73a5473bbdso2324802a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 08:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773762907; x=1774367707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8ibux8nB/MhHnX1SyYOz0IsNXVQjw67zWlanOsT53c=;
        b=PucHr8pIUbZBx3gBF2TE+YGpLglnXec1O2hk7PJEM1Y4ZETngyf/W26vQTSdOQDMyx
         EcPnLgEPBnV4MQZtgv1LJ07x04RR/t1LsYdQ2/1yTmWRIuGitAwUDryuAc47dmrZdXNp
         H1GjNjZaARQnKpWHcZ95JAtEbm+MUlw2f5NTCzTM0RGxKEqVDO+i2AgOwN2SmqnBddTu
         /GHa1sFRA1sIIch8D8GTcGVueyrUTZfnhZzLv0eW8Pk2DJgfUCOMDIG+NMFmjbJZl4AR
         ZD2KWomntn0Olle+FlezQNbJG0X31SqeoqnhBoXdBNdsLCoyZBqztDV8WqwEQI76UWA8
         Xv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762907; x=1774367707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f8ibux8nB/MhHnX1SyYOz0IsNXVQjw67zWlanOsT53c=;
        b=haxioAucTb1u7GohrwVdZ6gzK0OcTS6taR1YKQuSigoV4GA7EiMT7dS+3RmlkiOQIU
         BAygVRX7p3BvjpFXWRPFg8AuTgZNjS70pzxPua7WlN9tLEueAseSSXr3ZHpqHoU8KAt7
         OkCn5zi14fKW7hkqUawWF44eh23XFzDJs1tY8JB0ZUZM9Mo0uXtrM3BF/DhjtGo6BBFB
         sXZB6qTI2h9jsZNTTSlzu594qb1w0pQ3aNYUmn9knQUOd8nLTS66FWrnVs2gJhxvErXl
         UZXEemkrxXfxWZWVS9dNZrYeBc33X839wmW0FVCDWWoxdK+3xxwUMOjkBJ5Cyy9JepuN
         7T3A==
X-Forwarded-Encrypted: i=1; AJvYcCUmLcLynueFmRsTOKdYCrEeWAeb2+Ha9GmR7UwdIMh4urtgRdbIG08fvzZSN6G0GqOHixsAZ7cd9TTTsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc6ZrG6809LuIugPlGHtCCU3bOQRjFZlVmJTOFJmb9aodWStpT
	/5bUhVMBEV6qvmxtawiKOieOlBu7ioHMlKugEv562DpTORCneAepKokU
X-Gm-Gg: ATEYQzzgyndCEHgwHOSKw4wRV3KUvH+Tw2wMDhwTbrYpZsjC7iW46siwgFXP1SFEMy/
	wUgTEzDJ5P03dfG47+xN5LNZxp+R67NxbOJMfT5u8i/JoEQBtE6/Y87iCP1NmpMHC/XrmHtMaVb
	2s37Hjmc3wKg8yWJ8D1OZyIzHVHYX8x7cDvtvxqmq/71TKBKXaEGrdFYPQIZ7tdynTTo+dgadXZ
	mVyEmhHWZpoqyfP/lOvKr4uWdek40gp7hnzmND1xTmQpuJDgI24lubnaAmDLA1GJ9Ut0eljWv4q
	L4a7zPEoLCcfwhmudkpVxkVYfCuCjpbiGw0Q5Lsw/ar8Pw20229UWhYGT+Gkwe5pBK0+OtxOgRf
	m1Wf6RpZzHjibGlyK+Jtm+qg4D3nCF2E6SwyjUdZvp0AiPqjytJySNG+csyzY5yUkwvZu2F34jh
	7QjzlMenOmjRTjZw8sZJQCqzPoJWgRD6QLngxJ
X-Received: by 2002:a05:6a21:516:b0:398:9044:77b7 with SMTP id adf61e73a8af0-398ecdd8a48mr15587743637.59.1773762906804;
        Tue, 17 Mar 2026 08:55:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e5691b8sm21201a12.25.2026.03.17.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:55:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 08:55:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <7f043ae1-c863-4884-a2c7-710a8d9d8771@roeck-us.net>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>

On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> The G and J coefficients provided by T-Head TH1520 manual (which calls
> them A and C coefficients and calls H coefficient in the binding as B)
> have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> respectively), however the binding currently only allows coefficients as
> precise as 100 milli-Celsius (1/10 degree Celsius).
> 
> Change the multipleOf value of these two coefficients to 10 (in the unit
> of milli-Celsius) to satisfy the need of TH1520.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
