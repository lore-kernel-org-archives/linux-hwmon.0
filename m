Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975932;
	b=ee38YvPu8dQJXa5ktn4JPdCzYz9H2w9hzktlO9mQVwB7xTYpFFMkPVfZ64SB0qWuxv22
	 5vo9E21q6bWcd/8gS2P/sAHJ0MSZp5iBdv2AKwyU7i6ujGD7yE8b0Qr1Gn73dwdHn6DiZ
	 ezwp9wLkh1lfwjn5KUHq3ZSgEQ2VQnTSNE0eC8D00bd2YTe77jHkUKHyAGoNCo8xbQY1u
	 UXhZhVUeoDaBLf1XlBS7rtP5IR4ykkLGFRPmHgbru4P2IKUzuh1FZb61EhqBSgGj3B8Dz
	 4mbRqpiab+EkZKNpMZIOvbGPIdW9QPfO/KcdE141A0ygc6y5aKpQJEjRPEN8PY2GW3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nxcPZJlNCnH66CCsQiTw+tT9KwwfqSrDOMhHONAfHsw=;
	b=LmTZSkqR/nAB+gCpmAyCzHW0hzQ9UzE5iCPJfjEV+dtRoTfEd2vlMwAlXjB71EHPGswC
	 sXMXBBDogdW7JfmrF1P9AZbhxb4MATAY3PV6wu6Og1sIqxGsV5py/qiQ62H5rt88EPZXE
	 XA5utita9nNmkqWa66xNDlGKdt1SFosqRLnUlsdlqUpqyVUoAfNsugKcdW5r7+6XjzmEM
	 hWmcBZ/BW3taHPh/pywviEU5h4o7TxrQqPfqeoEUVIR49rlHPsUNJQauKafuntSNUJGzC
	 S2qFDL3VTplkHHlfiwgH0rnbufiQaO37Bdv7xJRp9I9nVe5Onkeeeju5i+u3z6aaI/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JLiv98s4;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318C7606A31E
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 318C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JLiv98s4
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1042397a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975931; x=1793580731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nxcPZJlNCnH66CCsQiTw+tT9KwwfqSrDOMhHONAfHsw=;
        b=JLiv98s4YqkSGy/YAMVSYMlJ0woAIxWscas4fo700f/9Eqxx1lo+B+3hfO4/C7sgzX
         l7M/i2tyVbmDXrvILQZnQCI58XAW8xqPoYgJrpK76iUit53dWE14YO7GgqmOkiCfIOGU
         HKPw9MPL/xgwUYF5eeHYtbYlBiOvaw37KD7TdzUUEWCjdMLFHv9Z807DxXOH4LWXgg2w
         iQdbY9j8WLfNRw3v/bYtsf5EVyR45hvOMwQwiFm9SZewfG+sXpYQ7Ar8ZpBtz/2ujMJ7
         kSwWqYq880fyih+xvFpJ2xBwG7AcbahJ6fCX5hRO4G4oGb3qMTXTVbrQqeSo6WvoTPyk
         /61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975931; x=1793580731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxcPZJlNCnH66CCsQiTw+tT9KwwfqSrDOMhHONAfHsw=;
        b=TY0dxhkPcwKHqOYldf/t7AOIbUjup1pTapcYGHSQuOXiX8d4FAmCLdaAaGNDYHclEY
         OORk7NVGOcxXAZpM5/IVrLvbGSRj4hFetrmbDVlCEgdZT9CTMNshyvoqXxLrgSG6KTZN
         1UCnhtwEly418ov9iJbsxMh7rdRkrDjXqo2Dp8g7jPx/34qJN2kX7XHRXjmrybdDWnWg
         lkWHi+IR4Xrn184zubQLTA6wH7h/Giw5r4g6AhEoCg/Liqv2DGakfsva+AUzMt+P1fvr
         s88l5Te46IoCmnQrJXbp87Ojpil+NJbeap5xJZRCKAT5tSPgV0efZsXAsIEHqtsiszX6
         5Cgg==
X-Gm-Message-State: AFq9FYIk5FJRLHLQuizwA+rJOUY9tmX66++YtU8cr5uniLdM41rD1eaB
	j4ZlVofqFGzVDH/Rh3iA1zf/yUmZ0aZDgD6nlzhLrpcUESt5AUkEKf9v
X-Gm-Gg: AYBFou3ZEK+b9x2tv8maw0GqHUhwwWdp/Py1TLXy94WEwaZUbPSDXeQ/KQOoh2TGg2g
	nV4X4OvymCeIO4BWe7E5qMB+uomjzJH2dm8CurS9+fTUp8PLxsovnf2K0+V7nLpZVrq8J2KwDJR
	yBSkIjuzfIgaxa8AoSRi9HAno6t+41x2+dzvh31xoq0sz9qWX4wAj3Ly6O2Lxz5Tf5JWKRv7TBq
	LNRfowvcAK+up+42sc5crvnDLLl7/B7n4VFJlJ5G1+bx1r7UZ1TVuguqc4FsJcxGwAApVM3GFR4
	kkPCkDwIKthqsHZZcdNSZOEinwE3zJ/lXiJN+vTmtiI8EkbChlCmddo8Li6r4+9e+aEif8JMY6V
	pcBoGzQ0j3ntnc9DU0OSmcWcqmwBg40Zh/Hy5efLeonfAcmj5llDu+/jvfV05xLR3BSzVPSXZal
	UBRHLGwmKR7nrQLTmanl+WrqQG0te5WhKKmbUhQWjsP8JkRTsmoORQSGxBK5BUTMD8cGYX5+6CW
	GTVe51fYxegse74HN9DZQNpbd51gvznuELl1+KUhowgQ01EdVlVPpbjtkzTrac0uk5BCg==
X-Received: by 2002:a17:90b:17c1:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3adeb130496mr4206632a91.49.1792975931364;
        Sun, 25 Oct 2026 17:52:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacc885sm6130747a91.5.2026.10.25.17.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:52:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:52:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jason Luo <jasonluomath@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/ucd9000) Add monitor types 5, 6, and 7 for
 UCD90320
Message-ID: <7dbadfc0-cfc6-44be-ab80-65a39f64c9b2@roeck-us.net>
References: <20260926220522.GA63217@DESKTOP-F7UNNQO.localdomain>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926220522.GA63217@DESKTOP-F7UNNQO.localdomain>

On Sat, Sep 26, 2026 at 06:05:22PM -0400, Jason Luo wrote:
> The TI UCD90320 power sequencer defines additional monitor types:
> - 5: Input voltage
> - 6: Voltage with AVS
> - 7: Input voltage with AVS
> 
> Because ucd9000_probe() only checks for monitor types 1-4,
> voltage rails configured with types 5-7 are ignored, and thus
> are never registered with PMBus.
> 
> Add handling for monitor types 5, 6, and 7 to allow these
> voltage rails on UCD90320 to be detected and registered.
> 
> Refer to section 10.6 in the documentation below.
> 
> Link: https://www.ti.com/lit/ug/slvuaw9c/slvuaw9c.pdf
> Link: https://www.ti.com/lit/ug/slvu352g/slvu352g.pdf
> Signed-off-by: Jason Luo <jasonluomath@gmail.com>

Applied.

Thanks,
Guenter
