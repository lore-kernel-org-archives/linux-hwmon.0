Received: from mail-ed2-f40.google.com (mail-ed2-f40.google.com [74.125.228.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2B250E5A3
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 17:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789666530; cv=none; b=lEDN1ExsjglyWOLDSAf8maAAgyzcGy3y5T0/TfDQY3FgKwNbp/HDJKXuzt5aKiPCF0lNgh5DX+GeQ9ZLPon4WkSjCfjgMgK22kNA7XyKsCsCRIcTxEha1f04VwqEGf2TlH0PDqSH+ox9yH72QIbMzK1bQhQJ9yPaubTbl3ToBfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789666530; c=relaxed/simple;
	bh=Abs6oQjspUnZRtcLJSQo3YNVs75W8jWlv0aKIw5nibs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr0mVDYmemhA/iYPyHNxAtJrQw1rYu/wGwgTSGPTmE3VyIJS+dN/LXWVlfyoGINwrsEaLj9zW7I09FJTgAzjEWQFdrYaOEAIDz6EjgmsWHgMF3OlxJSCzVQT53yz90TH/U66PF6jCrUNWXUdt1LgT4AAFFOc847Y4esshLe7Vds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGrXpwNI; arc=none smtp.client-ip=74.125.228.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGrXpwNI"
Received: by mail-ed2-f40.google.com with SMTP id 4fb4d7f45d1cf-6a60590a85cso2310993a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 10:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789666527; x=1790271327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XzKZKOCuf/le1CjYXA1cH8J+uVC2s8tuoEzu3P186r4=;
        b=BGrXpwNIkqOjG4G2VZR/xyioRxFGmDTBuK9nNTxTv1mh4vAnbU/BrITxpJl3LH/C22
         YUkuYoadr5c1/oePgo2mC7dCEoWHkIsDQXTir2zL0d5uq7U6ujIb2WD/rqe25X98P4Qk
         nzyQCT/uzF/6/IdflETtkTKCW/n8HOIktJFdGSEiSMPTYPYUWniMrrNFV3mwBOP+JjTs
         Ok5tYiZA3/yuwQY0Jp36MQ4A5qoYTgclbcyvXlEs4FmH8wVya0J5Tkl9TGI3qWvjMsme
         IO7cdmiUG8tMYfMppFQqQN2vjjYN/3RgXXvWT4SCdrkDy0Wb90Fifs086qmFOMfXWToE
         AErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789666527; x=1790271327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzKZKOCuf/le1CjYXA1cH8J+uVC2s8tuoEzu3P186r4=;
        b=N3mOO6QolVIYPKjhqQfDsg2qYnAxES7Z81POQz+m/PAdJ/p5nUnJyolTwuvv3pjNQk
         mSB2KBja15K/zA4qytJ1OayaNlfF3XRhqa+C7+D3gu8SFagxUnB8ZNpLXLg/8W0s5jgA
         7+yC3+X/H1UQDkTYDxoDt8KKBamIUY14IPg7p8C1dMOScxVcSoIJt3z302EisYiVBJk+
         Tz379QoMLRLzXhavbmhRMgojKusgdKQm054VVq0OYJtaU1A93oevtec1+UpemAa+y2UF
         bB4umaBUgXIv3KmRHJmJ+FL1OrO2xrPfophVpRArjFBebWq6W5HsevlD1gdXQlx8AKUI
         cAdA==
X-Forwarded-Encrypted: i=1; AKwUvBxGyHTV/fDmxD2rYeENyaDr6lSEpNi1RqQdSNcUIvcnUt8rhILe98e4HXCPG6jd2outf/sQd3xbbrTwnw==@vger.kernel.org
X-Gm-Message-State: AFuF++lE6NoDoBsIdhDnOaJ/gtDFWZ4SpclFZh1tdiDD8q8Bm9cAKKB6
	nlii0rOEnFQD0t8qyBdZ4vtinaubVYNM6Wt+cGPrIY2FciJcWADi7/0Qg/01hA==
X-Gm-Gg: AYBFou30EndQJSUa1cfGp5maH/UlKwdNoR7ji4yhJpmqB4oMbAw7FGme3CM4rkTbMyU
	/pNLr8A44aNJyJXPlpBwhFY9Fyg9w0kvy314HjdjT4lSbaNQ0yX+lpAi9s8R9gPaGUXSIOWMzv4
	DVnPx78RQ9H9q53feNmEvK2kfob3fGfcXIgOKrTNrynPaC7sr4u5tngOjGih4N6Fam6zbAa9CNn
	5gIeRBImG+HuhfmcXGW+0AGPvKh11w94rlUHVYxbJHg+qAMnT/HTUtjmnDmwwDShIFNIpNO38/D
	H2G4b/W84r9MnwqB5rzSEKmU5kcIA1j8Y1zp9dMSZwh0XFB10jPQMRKZZp9aeZDHEMuxTAHFXEi
	vFq4xzXrLesDpL194VIpjkxvMwmBtD9sBp8kA5tyZU4jTWjz+dOhIvIOHOg33fuwATaqh84XpTH
	YjetFTkeSP4FrNeogAY6mqs2UueBKGtBIWnRv+acc4Z/cF6ErPGNc2Ho0zddERmTPWLAVH58OxO
	e0=
X-Received: by 2002:a17:906:f5a9:b0:c29:45ad:7af7 with SMTP id a640c23a62f3a-c29e53088acmr526598166b.30.1789666526807;
        Thu, 17 Sep 2026 10:35:26 -0700 (PDT)
Received: from google.com ([37.228.200.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de63bfd0sm311629166b.52.2026.09.17.10.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:35:26 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:35:24 +0100
From: Fabio Baltieri <fabio.baltieri@gmail.com>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] hwmon: (nct6683) Enable pwm control on ASRock B850
 Steel Legend WiFi
Message-ID: <aqwk3JIvOLD3rB_T@google.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
 <20260825092546.669450-6-jdahlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825092546.669450-6-jdahlin@gmail.com>

Hi,

On Tue, Aug 25, 2026 at 11:25:46AM +0200, Johan Dahlin wrote:
> Fan control has been measured on this board: with a fan in manual mode the
> applied pwm value tracks what is written, and the fan responds
> proportionally from 337 RPM at pwm 60 to 933 RPM at pwm 255.
> 
> Allow pwm writes on this board.
> 
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
> ---
>  drivers/hwmon/nct6683.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 6825e6c3af34..df28055b1a1c 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -972,7 +972,8 @@ SENSOR_TEMPLATE(pwm, "pwm%d", S_IRUGO, show_pwm, store_pwm, 0);
>   */
>  static bool nct6683_has_fan_control(struct nct6683_data *data)
>  {
> -	return data->customer_id == NCT6683_CUSTOMER_ID_MITAC;
> +	return data->customer_id == NCT6683_CUSTOMER_ID_MITAC ||
> +	       data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8;
>  }
>  
>  /*

Thanks for the patches, I tried this on an ASRock BC-250, also NCT6686D,
and it works fine there as well. The board id is
NCT6683_CUSTOMER_ID_AMD and all it needed was:

-              data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8;
+              data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8 ||
+              data->customer_id == NCT6683_CUSTOMER_ID_AMD;

Maybe you can add that as well once you send the v2 of this? (and a
Tested-by: Fabio Baltieri <fabio.baltieri@gmail.com>). Or I'm happy to
send a followup myself once this gets merged, whatever you prefer.

Either way I feel like this list is going to grow, maybe a

switch (data->customer_id) {
...

would work out better long term here.

Thanks,
Fabio
