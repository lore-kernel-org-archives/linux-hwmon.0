Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA9C4582D5
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928575; cv=none; b=CGDQpZpbsbx0RQin7qEpim9F9vIqAw/OIy8Yn854ZG62xvm9YJWJgOGWUKyc7TbRttO/7NdpXFAS8i54et+rZ+2QtX+M/OfMrjCaTtCVXbLhjNQyR+d7CaTgVdv4lJ6fQIMSKOQgHxlcW9mAMvKgq9lbY0oB2IB6h5TsqnknecI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928575; c=relaxed/simple;
	bh=d5ZReLzWXererHu138S4fG7P2zt7JgzXoiRx4LsvY6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwDL7I6bmXgMM1K3I7Q3zU0ChfUORBDU3JjvHKnbnKd3PjIbpuv58dOtjLnmPphUYLhgFm2xf2vHkJEWYhKdkwtwQm2Ik7UIrpNDUKbQL8oMs93LQz2V/gkOQ0g3sQyC+zgz8KCaS9FkMWcurle11z6a3fvleOqu0flI81hs3ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnRBF2ga; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnRBF2ga"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacb8416a1so10003675ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787928574; x=1788533374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P0PaOxzNtIIPEYVfBYCmVRSl8PUCkbVDHvNlUppfTv0=;
        b=lnRBF2gaqk7wi6SzceSvOenv3H9CzQYt6M2IeCIzitfJXYWuY7GSfUUAMIwfGQAKQd
         PJtyZlo949lP8bW1vjUFX2DBCBoKe78cTLdA07lyIdzD68L7dsan9URoiIY9uXFU+k6c
         +lfL+SSSDWL6yOxQLysWvS8r/d3+QwNE2UBly8OfZAXkD6vmajZ7b2FFBYyWQjhwEbFB
         Iv4M0w614gqPXl0/Br//BEQS54SASCTu5zqjQ3tye+sPdHfbOBNdPt0GXwyG21Qm/y0i
         olMaIDxxEopcJ9I0VLcg+cHlFl1l4iFqg2ASzyMF645rhuijtw53bCqQbVypc3APmBoO
         Yp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928574; x=1788533374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0PaOxzNtIIPEYVfBYCmVRSl8PUCkbVDHvNlUppfTv0=;
        b=iBYBfeKB/khi8Lgrd9ovAY9n0pjsmfbdMzLG0AvMf74U+tGJy5cQoVf8v9tM1OOK7o
         hzHZMpB1rExXO0MwwKc3sFeXR8C8jovO2tnUuvSBal6IEG7RlmaM2zxR/KuPZPeaVIMx
         Opx+voTAyQSkQlRNSsqdyLRJtC06A1EQvqb3myQuE5KDwmalEI8xgABy8eOBzihGmu4+
         4Jm+g55upAIF8MAKWSyKyon4RfzfMKggOHklNnpFu+9+shVByTJYWbWipI/2JsbcTs62
         sSZ9ha2U6Qs3dnQRipWmbx3Q5Rnrhw2Yx1/YPN81IlHHRve6f+3nMpL9qbfTRkBdJnz3
         GBkw==
X-Forwarded-Encrypted: i=1; AHgh+Rpvjf5v7GdsX2B2KbwHs1URtzmrVRGTcVGrxEj2jqIkq/BPxlNxFqcpTuy5/xy8eyVg9eyf2w8+qqaWsg==@vger.kernel.org
X-Gm-Message-State: AFuF++lhOvrSTOID6Atxly2yqCYE60wlOdA2RUwA4TUnA/guwwUgE7W0
	dnxHWt8OFdSawxEJjymK3Sofgur6qMeTKmQmGofxz6RuPiLp1FOOyUfm
X-Gm-Gg: AR+sD13KVc1IBp6ZUbQLJvKOd4plquxQ7B5o3WUvQVxh8Tg07dbBdxKDRd9RHGgSwsF
	Z8bgy00NGu475+rDHsEldN++iab3ukiMWGt3woyAgpaX+dOCZqNPVO4XA9yMobBimndkp2GFyWC
	jjd+fJaxHR1eKxoIFCbGCXQ3nzFTmVOMf/UJEfh25MRApRcM9s6rS0MVpn/uvrwY0FeginTQdm4
	wJEM2yyoUqHyp7prICTglQzkGPefhukSd1SZMwdMFncNR85em55XbxZxNHIZWKcKxLPhkiTzPFC
	UEhIOg8/5j0N1BBqb+FLK3nj0NjiLpIPAg2Gg6jVQoVGOabiiCcIx2Y2CaVFgARIURx9baaohKF
	l3jITpcGsUfQxC1AbtBob03M4fMPhSfm8Ar+aDTZb5wuFfpUjgzplW05BDfmbYD+QxD188TqHgB
	MDd6QGE/bgdXPdsO2fKL8KZdkWAl5vFmI4AKshC1sFG6fJx+OaMtqDZt+gmJWMrDUN0BUX+8S6b
	N/xGN8EEpZ7
X-Received: by 2002:a17:902:ebcb:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2d74cfcdb1emr183360435ad.0.1787928573791;
        Fri, 28 Aug 2026 07:49:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be607sm6576832eec.10.2026.08.28.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:49:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Aug 2026 07:49:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (applesmc) fix key backlight workqueue leak on
 register failure
Message-ID: <d2e6a29d-e707-4d91-a7aa-4177d34ec4d6@roeck-us.net>
References: <20260828105413.2401385-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828105413.2401385-1-congnt264@gmail.com>

On Fri, Aug 28, 2026 at 05:54:13PM +0700, Cong Nguyen wrote:
> applesmc_create_key_backlight() allocates applesmc_led_wq before calling
> led_classdev_register(). When register fails, the error is returned to
> applesmc_init(), which jumps to out_light_sysfs and skips
> applesmc_release_key_backlight(), leaking the workqueue.
> 
> Destroy the workqueue on the register failure path. The bug was introduced
> when the inline init block was refactored into a helper that returns errors
> directly, dropping the old out_light_wq unwind label.
> 
> Fixes: 0b0b5dff8967 ("hwmon: (applesmc) Simplify feature sysfs handling")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Applied.

Thanks,
Guenter
