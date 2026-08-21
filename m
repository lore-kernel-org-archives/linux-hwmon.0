Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6502B38D
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787335762; cv=none; b=k33xdUOmyMR8u7FsHF/mVL+C4tdFhMzseEzFw7osvyimfDTltItH/7DzpBFMtMSGzuyPNJrVsmiAZyejzBfLmrtxtUlKFeUjZfVfVINWx/bhSAySyTU2AWvuV1hQIlN/aOIJRv+Bama88dHA4H/fgfLIkq/1AUePmRedcyzAaBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787335762; c=relaxed/simple;
	bh=fRzzRtBhBuT3AN+u+UFCcOVfzEwr+BQb00hG+K7UXqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kS3X3lhEEHhGzO0G7ae7f9xHV9FYMteKV8Dea1WfwEQ93RcxrV1cCKyKMVFW1Dgbw+1evAmj8uQQs/9qsUwWqTWvQDPl9Qg6vPt8HleH/gM/uJJzoRhmxiVhVsi20sA9dTecFqBwn9B+JwMvp3YtP6KXqaG6UWZwlcfA/3U5Lik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AigGJ+kO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jNB3lqOm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AigGJ+kO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jNB3lqOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787335760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NGNHCG2S90dL1ilUQqiDCnuACxnKluxw/vvCoZVLc+k=;
	b=AigGJ+kObiuJdDxX2xZrXShM5n5CD9PzEKKiEwQgPn8qAfq7J75LWE0BWBdbciHcAKCeB1
	Q/lAhR/8J1S1wKla0VRMc9+yDTZShEey4e/HwjkSEAbkHMT1iOCmoesv2PvW8z3HEwLe0w
	Yppd4ZI/yfmHr9Tx7rRuN+qohhnyJPc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-6FeqoplcMO2vbgZcPLToqw-1; Fri, 21 Aug 2026 14:09:18 -0400
X-MC-Unique: 6FeqoplcMO2vbgZcPLToqw-1
X-Mimecast-MFC-AGG-ID: 6FeqoplcMO2vbgZcPLToqw_1787335758
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso24724271cf.1
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 11:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787335758; x=1787940558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGNHCG2S90dL1ilUQqiDCnuACxnKluxw/vvCoZVLc+k=;
        b=jNB3lqOmJH643tJ/gwOfOEItsLh7l+nf1KboFzB1ErbSPLWQHaF9ynI8gptyi3koH6
         KYXSwREUdRW1+3Gt3fDoYrjNfDKXuWXIlDNYAF04nnJyEUO6YY48qblDm5Hb2m3fxdJf
         jcfAlDzEU0614UWBp1w2RYB6kISh8zUD54oby2AVxilGHPw5be0VzPAc0aisD+hEDhdO
         0Ks2SVmaf4zJF3OCs6FeM8daX4s3ktQDPGuPOxyPkYoa5l4OaW2eeMQ6ywd8FlYtaiMO
         2gXrQfEr5/dG+cUhrCW6iy5dyMqSv9xAeI8XbtHCz41sj93lGYl7nvZF0oEkBglExgsL
         IXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335758; x=1787940558;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGNHCG2S90dL1ilUQqiDCnuACxnKluxw/vvCoZVLc+k=;
        b=JoNohYzfYWKB7Kk8DH7DvehL31r7RvhXnAFfCUEEwUglNPklT2sVSJhzpVt61lFIX4
         6iVYkP9BwatxDezkJ3C+J8o0fu8X+mJzTDox1i9DeOOkrJ9sTv5iPNuPI0IffJG2EY8E
         oQeTrsOq66GBBEaktXzMymMFqIFBOOzAdL+iXAM+5nEAkshuegDQuaCos3mmB0+34HR2
         ww0Mpr3i8cL3iAc168b+5V4nJ5LRuzV+oUj6IpE3aC8gMVIlsY4yjhJDWotQmuYWdvrG
         TX+WAzFd8fAeV10nX8UCzwdb/7Bz1wwPwgMnwRD0q1lCGXBndqDDeqNqirNSMPkRFmLT
         kz4g==
X-Forwarded-Encrypted: i=1; AHgh+RoAvmR7gY18Wtk2lrO3ARXLbdRPGkXrlbQtxW4/VR+0VAvb2YkFC2idq679L8lYl4lQnbANFFrTEI1ZYg==@vger.kernel.org
X-Gm-Message-State: AFuF++kj8eZJPrfO97irD6Toq1vHgJd7sMnSwf+LPHMGsCQIj/FCVF9V
	F55Xz7D1FfQuvMudntB/JXe+aGbsymFyj0jCnNXgJq7WJWMi/9IL08cuosp/K1o+ozQLB1NFPkp
	Zg8mQ+t1LnLeq6hiUkCfyd/K1D5HfjoXF9nkFDAaD3do4nTL9FBtaKGjoxpSTnqnhY7Eldbib
X-Gm-Gg: AR+sD10YK9hIxA9ISpI7KNLtwNW3TYVllR2lGMaRVNdMX63FiL1ZHP88LZBvKTD1IGz
	C7WHlcluYjctTvHfN0zXT6PG4VxDcesPodGZS7STiGYDLd+OXGJSzsMHbB+4gEeZJsIFNAHLO7r
	VZcXEbqUGqRuQAhAUA6Fgl26wl1CWmfhMTModoGEyPA6JYVlxntkejnBQ86hsQTo4O+kQdFaosP
	6yijjQqDlFsrdX1Ai+5QGMstY8VjzVDWdaFbHl4ELnKK8ctiDHcVvGMmrTVH0kT38WHjSPNHtcu
	CQ+4OubKlw/MXJmLPfwDZcCijdp5/QQppb68U6vVdKAnYNHCaWiYCrrhS9bw0HDOUGaK1qSsYpF
	Pp5yFoyULQg==
X-Received: by 2002:ac8:598a:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-52df5732c7amr77456041cf.11.1787335758159;
        Fri, 21 Aug 2026 11:09:18 -0700 (PDT)
X-Received: by 2002:ac8:598a:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-52df5732c7amr77455561cf.11.1787335757792;
        Fri, 21 Aug 2026 11:09:17 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aad030sm97951cf.15.2026.08.21.11.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:09:16 -0700 (PDT)
Date: Fri, 21 Aug 2026 11:09:13 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: (ina2xx) Decouple in0 and curr1 alarms
Message-ID: <aoiUSeZNmbeuWnol@rh-jkangas-kernel>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
 <20260820-upstream-ina2xx-in0-curr1-alarms-v2-4-fdce35abc41e@redhat.com>
 <20260820132304.2B1BA1F00A3A@smtp.kernel.org>
 <d1b91675-7675-4b6c-821b-464e8f113144@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1b91675-7675-4b6c-821b-464e8f113144@roeck-us.net>

Hi Guenter,

On Fri, Aug 21, 2026 at 09:58:14AM -0700, Guenter Roeck wrote:
> Jared,
> 
> On 8/20/26 06:23, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] Writing 0 to an inactive alert limit unintentionally clears the currently active alert, breaking the newly introduced alarm decoupling.
> > [snip]
> > 
> > [Severity: High]
> > Will this unintentionally disable active alerts if a 0 is written to an
> > inactive alert?
> > 
> > Because the read side was updated in this patch to return 0 for inactive
> > alerts, state restoration tools might now read 0 for an inactive alert and
> > subsequently write 0 back to it during initialization.
> > 
> > When ina226_alert_limit_write() is called with val == 0 for that inactive
> > alert, the code just before this hunk unconditionally clears the hardware
> > mask and the newly added line sets data->active_alert = INA2XX_ALERT_NONE.
> > 
> > Since val is 0, the if (val) block is bypassed, leaving all alerts
> > disabled. This seems to allow writes to an inactive alert to silently
> > disable the currently active alert.
> > 
> > Does this function need an early return or guard to ignore writes of 0
> > if the alert being written to is already inactive?
> > 
> Is that a valid concern ?

I don't believe so; this is documented behavior in
Documentation/hwmon/ina2xx.rst:

    Writing 0 to any `*crit` setting clears all `*crit` settings and
    alarms.

I might be gazing into the AI crystal ball a bit too deeply, but I think
a secondary concern suggested in the report is that a tool could read
all limits and later write them back in a way that ends with a zero
write, which would disable an active alert. This is pre-existing
behavior though, and I think that would be more of a script bug due to
the current documentation.

Best,
Jared

> 
> Thanks,
> Guenter
> 

