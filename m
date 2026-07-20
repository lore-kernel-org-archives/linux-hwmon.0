Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3756D42DA28
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557863; cv=none; b=cCQzMghnzp+gWO0nDI7hmlvdXxk1Xvca2lmijcan4wTILU8u261TV4bl5B8jHV4tTbD4PwI76rLmS/6IXngm61ekkWeiIcgx57FTnzNDavGr83Bv5ydMk/6HMOIgtdBO7cmJEO3ZT+hQx2MSix+1QKcDwWHGMsdJHuqll36WZ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557863; c=relaxed/simple;
	bh=vbhllwkJKS2kil/R5LTnvXYoP33iPPfzuqtzbUnjeiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeDD5LqMNj1Uxhca6J6tSGSWBTTHtNavCWyTvNr1daJ/UEz/yez1+btU1g1PWwYjwbrOdSt0mMaiIG+5dkLHMj1Wp06YdewCGiRqqY9JvEH+hPgNv4sBQwog6Z/CQlJKVbSrTl1MKN1IAcKXa8M+s2Zoz4QiGWUlAxf/xNurWkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7VTQNBX; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7VTQNBX"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-382ef647e20so9625983a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784557861; x=1785162661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mDXO9+srSRe7fkjvMx55IDU4MpBVZEizdIVmw+G2XFQ=;
        b=P7VTQNBXQyeLgaI6OHgytlQSYans8ONksDe4aYzds97pFJy8VBRjO6AqFSIlu7sT+l
         JS1ZtK16khxDspN3vl5KFiAolFoGb0il4e3enszZtldo0kumY30jaf5dYLhwLRRidQbp
         FrrwwDTOMHg9gmB8iVkQVbppbvhJXa5w6UdzafxNdzq2jixLguKqUKPdRrfomk5gfHt4
         +808auzjARQX3GR2azvDnwul6WC61ZmOtavqf9P0+1orJGdJufUDC26TXAOIuRS8eqyG
         y2UF0Hf/1uDM91mlc3U4DxT03Co6tm6ueeDTvT+Xg4Ore1hURAIzwdWWzWXt62csHtg7
         qQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557861; x=1785162661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDXO9+srSRe7fkjvMx55IDU4MpBVZEizdIVmw+G2XFQ=;
        b=A6DHzCFQyxJjPuS/YBxB/9bzynMRQsZV4uhNWwH6uSTddQ/Mcpt9IyQ+kVFP+irwiJ
         Oo4lx2tAMFOfJqT6omZEnEdoiSTS3ka3GzcDVllNSNdxziF/45Vc41vhuj9S+VrV+y0s
         kRt8R/8mUwYlAs8b3Kp3UukRLtYwAYmi/2GpxzeLNE5hMfM/lPaNUMaxnJYXCcQdedXe
         yx4FJEMKiOp2awTPZ2QW7pLKDgy1WaEss+vPHyzQeX7h/tPXuc7IG3W1qxehY7lCqjQq
         tTrQA8KJgRS3yhZKF2ziNMpZd2RWsnrSis75Iz3L97bAW1U+kDSzEJCpcFhB/CsPgcK+
         kotg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3WjG7qqAl1M7pxcqvFFPaDyR09itnsidzreFl6TGmHDFATF5K8ON+/6/eFA1gBZWXBlXk5Sa8a6sE5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ4rQlptnLWW/W3PgjAhfkCDM67m/f/fdyCar5KcMS5vahbY3Y
	hxBw5tHkbdXZHiYsJm0edux9H8KQ7x0aSZIff7NPF18FswLJOra3eP0it5B6vg==
X-Gm-Gg: AR+sD11A+LrGtYYnH1hZ5FOxS8NNepr5f7EVsuQLkZ7sK9BwuYg3FbuGS8anINSWhry
	E7EYK70w6jtbhEjJNPZd/pBh31c1HHkRXSS1+5nNY6vjDTrZb3P8INMAd54vPrMy9+UW5E6Ejlt
	xsG2T94EHmvI6qvxAazpSO4MzrPW0LWFej28HcM5nbZGBwRoJfXHadQbxTkBKduxlQjywCTOV/C
	A4XlHg1tR5DaP9hxtppexoiHJmdY6r6NVns2RJ7hrDC+T1zwnsOv7dBgaKa6L42kylqWrTP3YR6
	fHQgXGr7IBExsMTt2PSBaHXWJ4MXHqEpM3W1sKNkF9sDYJX1+dCs2tSZA2/775lR+gSWV3rOPHW
	PxvZMHUocFBaKtPAuyjcHDq0ZhrlL5XswSn09eZ40XaJLa3Nsw8psZve2b/PtUAsOF7ORqW//lE
	8mKcCzaxkxC4uZ4pE=
X-Received: by 2002:a17:90b:58cb:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38e4b47765dmr14796190a91.18.1784557861277;
        Mon, 20 Jul 2026 07:31:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb69bsm27542922c88.11.2026.07.20.07.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:31:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 07:30:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Sanman Pradhan <psanman@juniper.net>, Arnd Bergmann <arnd@arndb.de>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: occ: validate poll response sensor blocks
Message-ID: <36ce8f76-4bc1-481f-a5f1-e9335fc66af3@roeck-us.net>
References: <20260720115826.14813-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720115826.14813-1-pengpeng@iscas.ac.cn>

On Mon, Jul 20, 2026 at 07:58:26PM +0800, Pengpeng Hou wrote:
> The OCC poll response parser walks a counted list of sensor data blocks.
> It used the static backing-array capacity as the parse boundary, but a
> transport response makes only data_length bytes current and valid. A
> truncated response can therefore make the parser consume a block header or
> block extent outside the current response.
> 
> Use data_length as the parent boundary, prove the fixed poll header and
> each current block header before reading them, and prove the complete block
> before advancing. Keep parsed sensor metadata local until the complete
> response has passed validation, then publish it. Propagate
> malformed-response errors before publishing the OCC as active.
> 
> Fixes: aa195fe49b03 ("hwmon (occ): Parse OCC poll response")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

The issues reported by Sashiko are pre-existing issues worth looking into,
but not as part of this patch.

Applied.

Thanks,
Guenter
