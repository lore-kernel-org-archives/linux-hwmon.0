Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B2E37C907
	for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 03:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778471192; cv=pass; b=DGCjcDR32QTIcl16WOkrwt9oCqZtfPtC/asrlGLkJRerysUI45xQf6QkKMhwgfPuJgYqzXywF1kb1Ln9W3XvDz4s0wIzMBmuGncw1xQ+4eCYVCckskSkwwOQyI94bTL36fJaTplNHkYg2LTODTYLYJxLFifiyVXP3DERxY8z6Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778471192; c=relaxed/simple;
	bh=+1qHEkLfxIoZVewscuCmC9HNjP4/clF+MrL1iv+Pe/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9EpxSH6eKxT6W/jNZF1VqFQM8dPi4+BbNof5k+SLH4ScsHZRMouf64blPrD2CzC+kU5rhONNVjj5OCo4aYmRGQTZvuzU6VlCOFj9XMmaG6MXD+ShjWdLKOODk5yJ1W97WFWv294YadvOY3nEYIt8nTfCotOfxdcJk199BSj53c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Ntl3BLzl; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Ntl3BLzl"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7bdec52f48dso54218417b3.0
        for <linux-hwmon@vger.kernel.org>; Sun, 10 May 2026 20:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778471190; cv=none;
        d=google.com; s=arc-20240605;
        b=X/P1KOipbiaRssIAQ7f46r7czjb/hQlMaaL6EXH+x77bopW8FPGxhRcGUDhZH3W1Ux
         wXLr+aBepFHwVHHuxHg91nDaw96zH+LEqUgKE/BPrtjGp8JI5uiqP4EmgMUegsNQ9bQ1
         zBmQDFsMuLAvfFJOBKSDDBudwLy6yKtjHD2EmVpm+rzU/Aj3UothjqyQ8PHXIlBLIw4j
         25ZRVf42gR4V7pqAdSQMK4Z+PEnrtpB2nErj58q4CPxrXPcrtZe+PtM8+M9iZHqhqlsZ
         QK870o1r+MWEijjiw9Y7VqUTiLsD4I3gWKZhNPtd1nV5iLGAg5sHO3gFxLCLHfpLaoxX
         ItOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+1qHEkLfxIoZVewscuCmC9HNjP4/clF+MrL1iv+Pe/g=;
        fh=fVHuQEAch9ciNFVAxegCLHZK1r4HmTpPJJmZPQfIuqA=;
        b=DsPej88yX0DnQh2Y98SgNIpvLDpPgkio+2DzLwzQ1AL93DhSErLSAQX4dBSy+uKZmh
         ClsZdkKKnenmv1X8fXRqqk41HY68Z/gTmyH9k6OOAMPBB5tnMgydz0/29CR5+QhG2NxX
         sqaXsYma6BAdRaSlvecrcf5oYTDeh5/AjGdpWTgnScGoPwrP58u3XVwflQ/5mwnDz64v
         3li/U4BHw+0v2cuuHF1h5GnzFPiX0VGTJfpPedG6nKgoNoPyVS21lT7o2r/rXXUc05Ws
         eQsKt7MPVVDv4JJKkvl45e9a3nQleSUTszis6JnpSzhi+/uXc0ppiRD4BCQI7XyGv1Rp
         pKgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778471190; x=1779075990; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+1qHEkLfxIoZVewscuCmC9HNjP4/clF+MrL1iv+Pe/g=;
        b=Ntl3BLzlEUzncNbT6e17j+a3usu6P2uqEy3G6Y+MdjakQ9NPoVXRHj1q0Yk9NwWxO1
         nq/Zk7ynUW9DHppN9tEnlaAZCKVAi/XmphMMZi3CLSHcFWjEywJ629mJV1BtcO4ufhUY
         foVa6zT0FcdjRjHbVzxsEkIdxr0LATmZC08dkFX7DPLFqax6+Dzgem9KVs9kjAi5wWeJ
         GqD/ptWHmo8ov+StUt8wpBcAaPWhRyPqrteeIJ25He5rbMsl/IKjoY3R39xkROiHTiet
         V+tRy1BW2aWT2TKA6TS4sog4ZJ8oPu1qND2JY0jJA/erFgR4yaa+DSqmDReFrAuRHC3a
         KClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778471190; x=1779075990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1qHEkLfxIoZVewscuCmC9HNjP4/clF+MrL1iv+Pe/g=;
        b=rnmdKZdo/myMrDAgOx38kpkR25SqezPb408ObkUjwl+lbMUc1igHKYhJBxD/6ydcqn
         gdJ8YzPJuQItdGpOWWNbYf9AF73zVNwiOZ999bmZxfeu8GW4q08CbBiFu8ZzQn6VmYdz
         f3QkfNrjvq05BNjUIx7o/ISoWwXUzIdPlRbMZynbuPs8TRec2tsK5F/BRRbd65bQMCCc
         sUO5ZE0IiaWNzW/OWFR6TKQ3d/EAOeIwEi86eGbbEzTeEDtxSDot5rGey86ey866Klk/
         TIQ8EbF78AGCLimfFRKmztLWfh0LI+xOzQzR0rGDeF2iXc+wcyKEf3RMEhmGd4o6VWF/
         mipA==
X-Forwarded-Encrypted: i=1; AFNElJ9wtEp5wQsYaEJWXeBzwlX4Vh6sO+UeXsGK5D54UIbKj620vwR+8dZz9KnN4LMlfnFAyRATlhnklGyjZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKBr+LCxmEg3RInCAlKqX+WNS+R3oLQ4c1I+gcuTrGb159XSui
	64+YzQZNIpy/mUyMMXo9ugciSZL9tVrdvYAnY2OPbUCfOyOCsjJOysrOVAc6cRXB21joLncBRi1
	3Av1ykHOx4qt7TTATyD7jH4EZAKnUPW3+O3qjvfa5tQ==
X-Gm-Gg: Acq92OEMTibjCFXtHUw+6F6j0fUgcFdH5R5ZcRvJ8VGawPmhRyMbcj/r2bzGYvTFwZq
	o+nP36hnEb7U8/uEI8xxB+m1Vhv2+AzDmcyM2TKrj/zx0xaCA7XDswgCuF8Dzu40n9GGD5MFJzL
	mXWOv7N3Yoa6koMWpARWFYHJswICuyEQ3HUDXgrKBIkOWkL72K/o63S0ZxrJwvfcQFoC3aJqfBS
	lhr82aOvFGREkMZJFuhKwxOiaC+VM7/Lp7O8jy4HysaGKnuhG7rFbT/0QCoVXoYWWRXc+v4WHNM
	wlYGk9c=
X-Received: by 2002:a05:690c:c504:b0:7b3:b0a6:2c60 with SMTP id
 00721157ae682-7bf04b126eamr137293717b3.1.1778471190558; Sun, 10 May 2026
 20:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
 <53d965b4-ab1c-4cb1-9fc3-c99538336d53@roeck-us.net> <CAGYn4vyDi8Z2i4mvuEZEP-nXCOO-X393=UuaogWJ9k3sXhQ8nQ@mail.gmail.com>
 <4a886ce7-9ddf-4fd2-8c39-a4c97373d168@roeck-us.net>
In-Reply-To: <4a886ce7-9ddf-4fd2-8c39-a4c97373d168@roeck-us.net>
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sun, 10 May 2026 20:46:19 -0700
X-Gm-Features: AVHnY4Joweipqm-AOztfgSuE-kce3xA1utwoWASIzJwoQMDUdAyaSBOnPiy1UzQ
Message-ID: <CAGYn4vyM+1pg9Z1zDuJ4AURcZtc=U_RHsWVAt9ox4SqDPDKyDg@mail.gmail.com>
Subject: Re: [PATCH 0/7] hwmon: (pmbus/adm1266) RTC fix, blackbox, FW rev, rtc_class
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexandru Tachici <alexandru.tachici@analog.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Thank you for the link.

I am not sure why the replies are being filtered;
it may be related to using the b4 relay web endpoint.

I will address the comments on Sashiko and submit v2 shortly.
I'll send the next version directly to avoid further delivery issues.

Best regards,
Abdurrahman Hussain
