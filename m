Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987B1215F42
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 01:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790387202; cv=none; b=VcXM3NKv0/0wobWNV8fPxpAfq/hY1un/sjUTxfWEclo3AxvzMXvJrEhUJmp9Zr76MuJmI2er0OvziTboqwX/DJrl5eDjJu800FwD5WhI2niTY3vEGd86QpGdxbDhxJkgKRVMxjcsIXpUFiCkmIQ+3sCOzF8oyyChopvD+7v6VCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790387202; c=relaxed/simple;
	bh=vwkqmE/L1SbBbgG7jkKKCIufo+UrUWTVHRbxZ9VQ6cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkAuyDAA29knY7YD1M4FpshMwforBMbITrjVxawW2jzOi8FSbgRc9x+V3cI861TS1RQ4A/lqtBzQGtRWJXjIhuaIa9yIB5BhQASXWkjWTniCPzUAO3f9yh118fBDQLWVASDF1ESY5khWNAqwrCjPHc6HINTc5mXXDgzjlzj24VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=of053agu; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="of053agu"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so13143255ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 18:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790387200; x=1790992000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NI/57maa8yM41Ln8iNyKbscX6tBjZSqd1TFGGzH5ius=;
        b=of053aguhFI71MJxd8gWFiK7K5/WJ4h88aBU++86+I/9JIy3dWFLWPNhcp2NTnmCbw
         WLCgiraNVLkRfzidgnH+OP3cBFR9FOphKFK+7N7NKNRx2h3owaT9YyK1320O+W40ra9d
         h7z5Nnn/CXA/zaSm+D8om85/Wt6z8fuO5m8V5U39e92ERT6vI41N+ElUTdy8wiMVHGex
         lQ1/LQ8bHlfZvSbiZyxmstyAu8EZOKRz0ZbrMkh3dneNFIlCUGXuwaF4/DFM/dxRE++F
         jMhDiQsvXKp9BcFu4OjDKYGAKibDrE3Vbdf1/uSE945mHfKsBYV5WKINz/xlGAoISDsq
         SuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790387200; x=1790992000;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NI/57maa8yM41Ln8iNyKbscX6tBjZSqd1TFGGzH5ius=;
        b=gRIfgaN5fKVTWX5JdwA8j0Go0NH7+pcE0+gGXFOmzU1sehQ8HLqG/HZdU0F7CFUxi+
         NI6gM2R1RWGIz/wMdnfgc83tpUeBk7naTndJ1HaJCG4OKpWzXDQgjktEgGUObVFTptBl
         jJKYRmYQmDy4Pt3SU3GmaV/jvwLw4TWX94sxZwtMcFaUqwd2rYc/Q/5TKdA9mjKWnoue
         jFZnITE15CM1gYN2+M6DChtXuSFZ2vlsFjTh7paNldiPXvdF1mo+dGmjSno/3gee45rL
         Dz2bzoS/x8sjhQMg8OR8+M5hb3eZsgaV7lwwHRKgpYbPfP6SVIMfd17oQI/xCtue0leg
         TMdw==
X-Forwarded-Encrypted: i=1; AKwUvBwvK/H1CGP6YAb6moVYdQ86SB9w/VksFImlhVuvto1+6UKZCOZBiF/sTlkK07r07sT0ZKbLzmQmEOqArg==@vger.kernel.org
X-Gm-Message-State: AFuF++m7wv+0ASI36U2zekCDgXEZxd8W4Kdt5LqMji//MlnS6eE1n7L3
	YgDaNo+pYs03D858m9LCTQjrbS8t12LU+mkK6Ve7bq1IvepmYLESQz2Y
X-Gm-Gg: AYBFou20MEPP0Cr1qivvzZrKeliupBpZgS28vfZ4tEbDCNLnzQPw1ZEodgA2gY3Axwv
	6Lcwfdy73E0oxuisq7malMisz6bn2yqtEOWYdowvnBnL3ZKr85TuiglWh7lsR5EMYjmWSgCUu+Y
	ZUE5n+gZ5tsvli1QE4juDA1D9pgEFCDnLPMJvujdqYezCF5/CQG4clbCwRxTGi2m3FpIBUwaVo1
	1pYgxZXczCULf5N9Jievz1+eEi7g1YJucSs5FlkqdSsRts4D8EcjHu9v5Naife5RNjgAgyM9KRM
	1O/b13KXA5VaeQFUBDahU8SJfrcLSl+Dowd0tgUR8R6d7dGiIWFule+uHP2l/+J5tW7wkKHktQ7
	k++UxYAvLcUL+fGrtJdlCzyAZ8xgVsdmKI+IIxC08uS/KBOa+PKj2M+4avgWw1qG4owlzjoQguC
	RiC5+I3ZpTCGUWlC6TEgMXIGLlyCSuwAIsvs4zCV08d+l6yKRLopVdKXxxbun0eli4iuU2VGWpq
	WrrmG8zL9aOSo2hu//MdXA=
X-Received: by 2002:a17:902:ebd1:b0:2dd:c100:9434 with SMTP id d9443c01a7336-2df94c1bc03mr31488365ad.50.1790387199777;
        Fri, 25 Sep 2026 18:46:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e030dsm17439105ad.16.2026.09.25.18.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:46:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 18:46:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: alexei.solcanu@pm.me
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH] hwmon: (gpd-fan) Reset both fans to automatic on duo
 boards
Message-ID: <78883f5d-e9b7-4fc4-a15a-d5ece6c9c8c3@roeck-us.net>
References: <20260925-gpd-fan-duo-auto-v1-1-29bb670b3331@pm.me>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-gpd-fan-duo-auto-v1-1-29bb670b3331@pm.me>

On Fri, Sep 25, 2026 at 08:13:26PM -0400, Alexei Solcanu via B4 Relay wrote:
> From: Alexei Solcanu <alexei.solcanu@pm.me>
> 
> On boards using gpd_duo_drvdata (GPD Duo, GPD Win 5), writing
> pwm1_enable=2 only returns the first fan to EC control. The second fan
> keeps its last manual duty cycle, e.g. full speed after pwm1=255, so a
> fan control tool that exits leaves it running at that speed.
> 
> gpd_duo_write_pwm() writes both fan registers (pwm_write and
> pwm_write + 1), but switching to automatic only clears pwm_write.
> Also clear pwm_write + 1, so both fans return to EC control.
> 
> Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Assisted-by: LLM
> Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
> ---
> Both fans were set to full speed (pwm1_enable=1, pwm1=255), then
> switched to automatic (pwm1_enable=2). Values read from the EC 15
> seconds later:
> 
>                  0x047A  0x047B  fan 1     fan 2
>   without patch  0x00    0xf4    2542 rpm  6379 rpm
>   with patch     0x00    0x00    2545 rpm  2560 rpm
> 
> Fan 2's RPM, found by probing, is at EC 0x0476/0x0477.

If this system has two fans, why does it register only one 
fan and pwm channel ? This seems conceptually wrong.

Guenter

> ---
>  drivers/hwmon/gpd-fan.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index ed212615b2f..b3b75f99f58 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -444,6 +444,7 @@ static void gpd_duo_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABL
>  		break;
>  	case AUTOMATIC:
>  		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
> +		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write + 1, 0);
>  		break;
>  	}
>  }
> 
> ---
> base-commit: 3cbb5f15e464583e59c8501a7085ec12b53e23ac
> change-id: 20260925-gpd-fan-duo-auto-871de9e006dc
> 
> Best regards,
> --  
> Alexei Solcanu <alexei.solcanu@pm.me>
> 
> 
> 
