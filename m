Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A78D41A57D
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Sep 2026 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817752; cv=none; b=Yx6owWMlEDdQwPjRkJ7/gWtmxoz/btDugzoMpzvmbg+qSR5hBOYX0rsnzXo1gZTDRIIHjmN50hNG1IeiTPLht5urOFhb1wlg4BWmKt0Xxya32R0Gzzq38S8bYM4W68Tkn3YyhWa08JoudU1XAEmtfnZsVlknb8ZyLhgjBdZzaVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817752; c=relaxed/simple;
	bh=db6RuuBhwMozGXCwqVkwUYnmsJM3LcJNboRTL/tXiaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XL/gZ+ndae1+9/jOEYx1CGNSLC6kgPR64FiuTWCozeZifU5q2eE4JABg03yxfzNwrBF0EWvCLfzhcsvbC9rxqwoF+Rvg9bqKtIpg4ZJpbHd6TJTVdwQuFWwfEFe6aUXhD7cClQwviUfGfAqzzLOtdiPtr0VvXXpdULwVNFKRNYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAmVntU2; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAmVntU2"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc52bd91929so1180220a12.2
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Sep 2026 04:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817751; x=1790422551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LB+tpTvHTK46vCvYu1SsitSoCwkJYe5UWMMUceYuMuY=;
        b=aAmVntU27V7Jpb6qixRHxQiRGEsiv+SodGwg1szoBCVFt6t/ecYo6AWH5xGNkRZ4Iy
         m6Gmy6G6EWn6HzihBt8Nw/liMpAkm4ldObabO0dzkNka/Qks6cVuBMQglWzt06E/ovKG
         /lEvq/Y0ZVwuEwjGsEu5ERW1XJozljGNccr4YF41/MLhZpCqNnFb3TpfI0BOe4r3z8X7
         6Jsjs0qniPXYmnetIqxiw6xsj/uKiHDsMy5ZkSvxFr5ahm7Jdp8NWHg1dzKBZjGZGwt1
         ftYbNLULYxxeQto3aho2mHCOq6Nw+D3N70ieZOxqImynTxitGkM5YDTxKcklJVUAo1A4
         QGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817751; x=1790422551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB+tpTvHTK46vCvYu1SsitSoCwkJYe5UWMMUceYuMuY=;
        b=h8kJ5VzLc3rtPxVyem611aqpOn5ARxebYwgxUqfSDckGK1Wx1nhQTU5mDvpfeimK1l
         dn3SuSw7r4ASd4WfaU2Km/jvG6/kysXwdijf4Ht5bUpcUyMVBIM69bpahDIbFG85C5Rv
         0FVJsIuNlvljj8k6KnmYWwt4TL08U6BZSxlP5M2sQag+nSMF5Qqka8uMFXi1rq5XltU6
         1KAqBogl05AhETtCvmQGfjdgADgJA0us3C16837Lcq3pEDTDeAPyi0vVpt1OHMj0Hy1t
         asOoAQ9Cu9vA3ksX/igCMhTvY40rsQP5L3pCI+IxbUN/LWQQBi/Ms9c01X+y/c+vKVAO
         R20g==
X-Forwarded-Encrypted: i=1; AKwUvBzNwaCOAqX6yNFuk4QsrzJKNURPQ7FBvoXNqRvuh5VmIo7sPu6sLq/1i233QFUtmJ2fsM3fy3jbiNZ9+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lgKpnr7xsTfLkI+0VDSebBifJpcZPZMeAqo9o0uf3cF8cMuCd6
	ksc1pKFVC3EgRekelK19hsYRFIt0GcxjT6Udsn97FhV8t/nOe6GZc+ns
X-Gm-Gg: AYBFou0I0UBKT3gvp5aUzWzDt2M9bkcsMk1lb9dtryH9T3FK59mmGQOttEIiM1AdsYr
	Rjc5BERHRijQ/nFP38glR41SUVYzZfAOHQoTe4EKpulresYMMU/7DPvZF07CUb3gbK/HyCdoJUP
	2Gsbvs1cnLbQcjHtz8yPOEkGfYjWpc/XJoK5PuRyIocZePKlu18fhoLjRnXq6Fi6SEW3eIglBuV
	xUX1BEir8V31JEp5ApeM8x+CHLOnx1Ks+x+uboqijHN3d1/PPgWwU46AhLp8lgC8e0gC7WkS8ue
	SctaqPQNqndSOBqeli6b7SpIN6NYpPQ4XdLWulPyjoutvkNiOlCHjvlK1NG7PROfz6oR5NX/WAH
	/4vSfNBQblInaa/mInMvbJ4iNckCaS73zmMdMiokyk/skYJXu7FCg5vePJlqF/4hc7UMFm+5GFs
	fZam0e4y5k9az7e+SwrPcIPbPng20rY9zi6KlZhYHxnqzzs5kdLNJEDepmrXGdi1h4erHwv2zCy
	ioll8wOZ7po
X-Received: by 2002:a05:6a20:20c3:b0:3d8:1f68:59ac with SMTP id adf61e73a8af0-3dd8c529902mr9848155637.23.1789817750774;
        Sat, 19 Sep 2026 04:35:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f17d77sm6091435eec.3.2026.09.19.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:35:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 19 Sep 2026 04:35:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Message-ID: <d815627d-b03e-4ea3-b8d3-52bc3448c798@roeck-us.net>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
 <20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com>

On Fri, Sep 18, 2026 at 06:23:54PM +0800, Colin Huang wrote:
> Add devicetree bindings for the Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators with PMBus interface.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied..

Thanks,
Guenter
