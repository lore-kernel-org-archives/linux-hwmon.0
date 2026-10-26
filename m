Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973932;
	b=VV+OSM4QSaidYA48MmCxmZ47Vyg4rRSZrQcA01LoYfS7Vp8D8IzKyalLTg1D8wUSgIHR
	 YpGtDvbUDNMyX753QbkdEjl69BI8UT8kjyT78036NY7cnnsC19BVuLxKS0UOStSyeAbPz
	 RCRnVj+5fAF2dzzKi2sGKbNCXoSavGgQ2YKVkmLncDC7KI5c/Jyvz7QI867F8B//oLn91
	 cfdKmZq8dWyBhMJBbHXONCKlTM49W2gjUgBa6kUgNWflYgNh2U9zqFbyfHA1tT5vDMwj4
	 q6nthKec+acw8H/5iNceQHhD4rIr6NaKlCDwTZHS58+SEFk2tUBB3hQ70MK4kKBlB7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=cUsHqc331eum7MGd06L3WBgY6ZncQT0yO7PFYFTsUtA=;
	b=YED3kw1njUpjkAV4nW9Qrgx5njt7jjNvS2faXmZB4di1G3+tRvotj3Ht8XS6e8tvgTUJ
	 vjB6vCUVGZKLraJMitbwHTJwAQ0RySmiXkqRhZND+ScHkDrUJR5fZd3HxydYSCycFOWrb
	 hSuvvL3EAae8lOnmOhcnJSf7TYxjoCN1w/aWAPUHVCMCz7+xloMELj7LW0LIyy4IE97V6
	 FGjNYEndBirIIYyXOz+lOjaHy3OEELYyH6vFJCc8/Em1eQ0TfW8Zfu0MMik4jYi2bAihW
	 vn5O48oU8MwWe0/stYrJN3qsKnXdeeGvIFLCIngT23J749XORKkaUDFfyS8b4C8+pEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcTe14Tv;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B051D606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B051D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcTe14Tv
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1353608a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792973931; x=1793578731; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cUsHqc331eum7MGd06L3WBgY6ZncQT0yO7PFYFTsUtA=;
        b=ZcTe14Tvc1GtW63KXnF0YtAWi2SY34Jh3SKTUEW0apMnrx2/9mEO1PaHddzdmAiy+I
         avwOS4Ihuak2xPybl3url/FxKxUMWMpMLs+g9qnv7c3YKQ+Pi8f4OUBvKtE5/kv1roZC
         0Xpi/SVTSAtvSkatRMM6lVHRKlPsY9brUTH4JppUsv+qC47nJxWHJlPCujxQUuyHnQGz
         /1b/iWq5aoZY3CQrtDFFlFaEwVxk0zZaOMxxNyf7aBl2idDpJqFNUAR0cNwCVurmf9d2
         O0qxHnT/NfXSsD/klvqxuhc5dEI2x2p0vbkWghT9A/Rh4oeViBDzHY3G+D3DbHT97DZD
         OhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792973931; x=1793578731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUsHqc331eum7MGd06L3WBgY6ZncQT0yO7PFYFTsUtA=;
        b=coWUftd3T8pRLVVvSqNdHMFcsY/nh14MuxdTmw4vzSUXLerm0W++wkpX/fZtb+IOmW
         R+jswCcxedpu6QL2Id3sE5SbJbvSB+g+K1hga8KrGUQhrdKNWgPFgcnTudxVeh/eBQvU
         VQe56eMSAHlqp9Sockj4iwJF80rtpU7J7MfGUGqo+sxFz//QDJB0N+Mw37WADwAvq5Iu
         CL81n6oImoBznebVROpMlGhjeHa7LosN1CW2CQhaAcpHWQ0uMBD9fntoP3p8ayqbcLPi
         Qq+Mpbm/Pfjo40bQJSe3J0ftQvVy8igewAzSgcu/xZCURqDfh1R1Ec3XiplQGkk8Zjr4
         XX4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxA1vdFExFhHoOpDfL7774SbyjyfKcRXBEZcCV0D2jqWmwPNqb2yyQn95SWosO06Vt6z+O9V6vMeSybEw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKIj+Tj9vgPyzBSpFsFjD3NGZIrmzsXd7a/ZB4XdcrOSd2mgg9I
	Lv0Rlo7Z82urS8EtrX/AaaMN/lNXH7UXFozpYnoG7kR100IRrsZQDQLCZRNkvw==
X-Gm-Gg: AYBFou24j0rq/tLngK3eEbml+uTyCiAVASnlNntktvZZUJBSUc5efC/OSMJ6UTwyHlG
	IGV83k3+jKgCXhG0GW5xMmnJn/lhe43gAZ77vnlrPuy3PbQEIICCe7GAamNDWAzd+8yo7jTCq0K
	O7s2LKqulfTYmYUGfZ+aQqcYjnAzN6+mYagcv0+eofnFB2lgnbrgaZXL9rVYA5kK3ijt0didfz2
	5mUsF+z4bUDIZftbTxB9FWt0AfPptTH3EFL7EKnXmyJoDQTQLVH5LWo6rM5N6Bl1YaBRZzB99vf
	6eNyXKkawz/EZFYFltIxEBG89qYQd8NA8sUZpKbEFJiyCSuF4AWeDIxj5l6tiSvsM0Tf1Y42Xzg
	SXpY+1u/leXt0Ox3OjcXQz+i/blYO9iphLkYJ/n5TS/+tHOxjA6zX9Dw8v+yY+Bwr86pStwHYDS
	Sj+4Ycf7rIQqJyT8qEhAR/YZo8zE9A2q1LY70xm+Itl0I4vjVDMyAukoaS7cvUP8c+JarfBMOsb
	m1NNdgZrmnCtJMZOYS0kntc79qDYzWWailenbvuV51KKWZrPt1NxaEzGLjQ3/VzZd45ig==
X-Received: by 2002:a17:90b:5647:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3adeae8342bmr4140679a91.36.1792973931118;
        Sun, 25 Oct 2026 17:18:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb819729sm5963589a91.0.2026.10.25.17.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:18:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:18:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org, serjo32.games@gmail.com
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Pro Micro Plus QBM1250 to
 fan control whitelist
Message-ID: <95b6055c-27ad-4e5a-bbfc-87722600b20b@roeck-us.net>
References: <20261024035735.6810-1-W_Armin@gmx.de>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261024035735.6810-1-W_Armin@gmx.de>

On Sat, Oct 24, 2026 at 05:56:45AM +0200, Armin Wolf wrote:
> A user reported that the Dell Pro Micro Plus QBM1250 needs to be
> whitelisted for the special SMM calls necessary for globally
> enabling/disabling BIOS fan control.
> 
> Acked-by: Pali Rohár <pali@kernel.org>
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/20
> Co-developed-by: Sergei <serjo32.games@gmail.com>
> Signed-off-by: Sergei <serjo32.games@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Tested-by: Sergei <serjo32.games@gmail.com>

Applied.

Thanks,
Guenter
