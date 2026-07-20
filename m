Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85E441B34C
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558157; cv=none; b=CMYkwNo9wyxFCKYrWnhHhhuRNh5ROetYDFll00i/icuf552+n+FN+R9U6LoaZRRXmnWefzGAZ1fQlDWXushm+P5z8tsfHgrxkHyrtj5pykTHV0+cxAdKwmj8h+jqN5WmGFDCQ6pb0ejgUsRVjMZeEhrt7CWRdFzRYGXZX5hcAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558157; c=relaxed/simple;
	bh=AbAn8QxkAFZeoeNVU6llOHNI02aPUy05wqQAEi2wywM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBya8HGad3PrJuVofqiD8kzoUO2Wqtjs0sljEu9BmRvXXLZekb2Za28M6EHliwjKICEWDn+IOAjt5IrPOqJxoysl2/3cfs+jCmbIpnYZ1VyDvokR7LDwJl//TzogHUKRqFebRUsHNQ9SuMXwqUeggt0UZkeucLxm1Jadzx2nnro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCT5kxoS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCT5kxoS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cad4170e8eso139793795ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558156; x=1785162956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UytwF3vcihXIBsG2Fx1R2su7tdNrov/9H1lB/y3KP+s=;
        b=WCT5kxoSAKfyWHfS6IgvN/581TcKW+uchdggcVJIwWBHlxqibKmcJDJS1xZLElaNSR
         DNxPO7SLRs5b0EeFga5OtV+Uq8C51HGCUj2qICguuusQfBEP1xKurUg16w4GZ3e38Ibg
         HNOWvdgzKfuXDuzfXjNA11o7IPF2Ydelm0DmbxT3D81saldjM2aYAsdxO7MBTy6rrHjK
         3KjZ3nrLlF6r0y7tg8wduIVpKUBAmHtfDPEU+mLT+dAjNSmlDRCcH6VBp6F5Y/b+qcm2
         qzknbnSQc2nk7l3uC0oqJ6HlsytKPtSCzyF8rdXFRz8gXRIPvuRCUkqMkL+BMcp3Hqph
         yi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558156; x=1785162956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UytwF3vcihXIBsG2Fx1R2su7tdNrov/9H1lB/y3KP+s=;
        b=kcv2D5u4nnKz9wx10LX4o04tyNkpcCBNkj9FUnuWglKS6psGKLAvRKERz9ktYtf4SG
         q5dOK239OCxC6JyR6rvAIX+o6ADpSI7/AKlRMha1F9VYkvtVXf917W7U80eE+NSjYn26
         c1uUUNNMSv26WYYHyfPuVrrTFKoTGdLw+8VWx9sC958glkVzrSp4q6vdIADBdB3krpLL
         HxvhldgdHYVwcIO9o0ARi6+U3pTh5vHZv8WVFR/Sk5WJ2K/ZU79DJQvOFQ+OxWkI20PU
         QPcQcDuk2skEcmEeIdUYGlBuvPIh1WxrGHEKk5KaVOw8TiwsvL+XNHjh7jLGwbvcMnVB
         99Og==
X-Gm-Message-State: AOJu0YzDx5vJRdRlA47Kin+9P6hw1pRSa6JOP2VaixvczuZDQAc5Ii4w
	krdkNsw2ljgZuPvvyb63DQug4xouYIg2Ihfcy3HbafkYH7qOLEZ3KnYk
X-Gm-Gg: AfdE7cktDrHkiNEA80eiI9GQ2AFteeX7lP7+ui01w2e535ZYVov17IJ6CAtmoi4wIo4
	mpvzAwtrAFgSSyida22QQv+xhcpRhnL1+4B2H7nncW740DTRC0D3PpzEPgxw/eo+ogwB1NkuSr1
	GsmKAAgESTudLnTmKwSm8q02sKRzW61QTGKGvx2PiQxLM/H1e4SRs2Hk7w4V2egvZGWu26JCa1V
	Mut/+PCoxH59t4DZexqPQlhcRLWDtyBeOf4CVxYID6NK2fEHL86hJV3Ifc5gBrt0TCvj/PlHpYK
	s64zILINr7TPrWaTVt6X5/Nl7s1c4DkUU1fsiE7L5zIeVANkgSPGNxBtm+CgVcoOZTerdrY2myN
	egGcpgO/jMEbQ/yWha+4dg5p6lW51LY+zvpAntRtbJQJXZP/JT3ho73fyliwKAH5YMyM5fsa29F
	M77VR9aDo7WsEGmLk=
X-Received: by 2002:a05:6a20:160a:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3c3ad629dfemr16294237637.16.1784558155982;
        Mon, 20 Jul 2026 07:35:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429ff04absm34672260eec.8.2026.07.20.07.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:35:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 07:35:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pan Chuang <panchuang@vivo.com>
Cc: "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] hwmon: (sht15) Remove redundant dev_err()
Message-ID: <59ed8efb-f673-458c-a7ab-845978bcc742@roeck-us.net>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-7-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720063745.309331-7-panchuang@vivo.com>

On Mon, Jul 20, 2026 at 02:37:40PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs detailed
> error messages on failure. Remove the now-redundant driver-specific
> dev_err() call.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Applied.

Thanks,
Guenter
