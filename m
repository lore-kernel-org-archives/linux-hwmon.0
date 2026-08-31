Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F9946D092
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196760; cv=pass; b=mB8F+zeX6qJcrMGmT++KsVHXYG0Kyv7xdxKwYQuv33rd+wcp+LBr9zg7wwFQVDRIy0CJUtZogqX2f960Rtb8Swq3FDhiFwMMoOlJGVo713zShIe6zBNGMw3cMR7HbH43Yd8mxHWh/O73UK2xFsZHUZzIk2QopSR+AGmj13qp/ZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196760; c=relaxed/simple;
	bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RE2LdbnqlKu3TUEDLPQZeSUdyh7tBWn+phfg2YzurL5ZB5CyXm+KklGIEKJlJ0mDne6qcvMEObSztJMkUezjFokTPtmSjrm9FTkvJklo7DvrPOuUAS3/ynhww22Jcg+Ik/DHui5T7aoFnesBXVaqlZjiJBqID6JQInDlPYHEYMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8VFmRTX; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8VFmRTX"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d944747d41so9019985ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 10:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788196759; cv=none;
        d=google.com; s=arc-20260327;
        b=aCqNEci1PEGzKTnkpmt+g2o5fhh4HLslAnzD6Pc0lajpT6gckZYDx44Cve/idtmzWX
         VLTKBxr1n/omnUDN23TcQ/oZ9EcQmXxDmZSquIxrEU/Zx23+lvOhN2U7lERg/4oNbtC0
         fQYFZb9ecoSms7y7sIlamPpBpfUMdO5TAFcmZdbzMAdT9gtjlW7EHfq6QdTVk+s9eDle
         DCahAV5LCYXEhmHRuHDwoXeaeodzuhyPtXbT6w7YpzqXMBRHG48wxCIrVaRURBnB3agU
         +aTn5GCLJPtCizmc23I60kQfE06P+50kSn6w1WqeoEvMMeCrX2Le9omQLg1SgSbIAuTc
         VRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
        fh=9QATx4E6z+veS/G6ixViFR4/BEaJMh1bYgsIGo9Fwfs=;
        b=RdboSUa1by8z76Jq/aj41Izt4OYeqcsuLC+yyGW65/WyvinA7faEBR1v/2kZLRw1ju
         edEFQBAZvvperzOHeYrnmWYNRxEe/ri8TNLO1M2yX5GLWPF+2GzhWrNK/Rk80iTlbCD6
         GgWzXVd0KOreTScyAQes04SwWzzh7MI70iTpHuwlhE4YT2eFrig3DmQoVYJIjf6FDbLm
         O/1zuQV5J3NZ7OxBXwMPPdSMVhAKdxbjy1esgKm+2YJfManMR+aXNpK2tBwM3HeMwfnM
         s2zi1gtJ6h8AIV/XzmXaPxsAajqdo8uffmIB0snKBZ10FlOZKVXotrErz82jQjhUVXNd
         eCIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788196759; x=1788801559; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
        b=X8VFmRTXbvDqoxLgXGat+Z26QoM8Ni9bVBsJTECGEijku1i+wcDfXJVjbcylsITqKk
         bhv1cBUe9psa+aH3B+7cG3i7eJTRuJ+JJW/146B1vCoY1dxGNH1WVqSQGPHer7h7IRmC
         kgYMIFn419e51jMovYk+v42CSgOpphBZPsjEdp0XZQlNmTYUCd+5XhWLAhKkczA3D8vp
         gA9U2ZxmKwd4CRLax+Y+c+Dl6RmHYNAejHuYdfT9DphQalkmjnKInYnXcWwhAPui9gR6
         hAQOtYC9tAbqxyrXWINhQG9rqgP/wme2R9i1cZYbgsxHn5tbRMHUVzIXOJCfLVkZ9h2k
         H3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788196759; x=1788801559;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
        b=h4luflBrJu1f3gXw9sQXTmamzQ0Zog5lm3ziTSVgDxb5cTeoXlr/r7O9RDPRtXEqlX
         G+eLSydHuB8mUkNUG/A/DnLTrJngQKxKqo0SbtMl+mmn2WtHAHuB+mjcJNjWQhhnK66g
         Um0gMLyMtC7nfMceEvjfeFxQmc0Q8cTlVl6aCqXNHqhXZzhz1DiPPo1cIhhkoIUOscn3
         yv+A3eGPV48iM2ou6JCuUys55PWfSzOXZNsp3Z/mxlIHq7IjgawdvCmiV2wEhdMsGIUn
         oXXL+KW89RzAP4pFirgr8OLOzf2gRCZUaDjhZNY1GPIy+r9/w1rXhIabYWgig7qeOhY9
         MV8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw6ywtc5O22Ln7oxbrIqNjvl1t/2tcgtp1c+/lCRUv2xA93PAZxXnw9/1+k1Qwi9O1fI5xYcoEunlvrkw==@vger.kernel.org
X-Gm-Message-State: AFuF++kZ2zcoYAsJzi3ix2fhVk7z6sEiL0V5DVkt758lP5K98ldju+ev
	smgsxMvKrWbAM84axUzlDQunhEj3CHDlmA9Mm07EEwbvtr3QDmJ6jWr9JtFCFd+IfqZUBR/OD8t
	iUw9EqNgRSbDkGlp1RSxdS3Yo1OdPFTE=
X-Gm-Gg: AYBFou2HYCgmACgYWkOkBkiLOZmUprS3TlI6G36KZPGMU+NxIXWhtw8uR2cpK1EE8Wt
	Xm0sw/VdiEcvYxIuYcCfaYjE5spXWRLoPU+q1aY2es0z1oJzeUJsmHaSD4lMylRwTGw1F/hioAj
	Zaq79nYsaxjmSdhbPzdtnFipr7ZGyyF7yDFh18VSpdLmU81IOYRJ+Nk1LRtDP/QMH8ZaPz/0OO9
	KmkhDFNI1RLdqH7DBMGKumvXKQjiqkebCRBMJa4nhojeOG0U+tLSgI38w9XRGNXZdprT59vhbZW
	SM8KOM/0DtoNucGrP6ayhaiBZPFaCJMuK6tPuCwPCGIGUUkX4LrY8YMJef6EqxwE7+ZZaN5Vbky
	n7i+KlSmENdr+3AxBT9PkdgpeE+JWYUa9m+/+wPaj1LNADA==
X-Received: by 2002:a17:903:2385:b0:2d8:d4ce:7e40 with SMTP id
 d9443c01a7336-2d8d4ce83fcmr275351495ad.21.1788196758727; Mon, 31 Aug 2026
 10:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>
In-Reply-To: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 31 Aug 2026 19:19:05 +0200
X-Gm-Features: AcwNN1WRhzKCE3-qq9S5IPJctdndIBtS6owhuM_r8cD37FzQpK4fkoVAkjdiw9s
Message-ID: <CAB95QATuQcbMWVGP3GdaguhC=MUEj3ZpnAWkJ1nyUjaSstWXxQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG STRIX X670E-A GAMING WIFI
To: sugar@sne.moe
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 31 Aug 2026 at 18:18, Asai Neko via B4 Relay
<devnull+sugar.sne.moe@kernel.org> wrote:
> Changes in v2:
> - Reuse the existing X670E-E board information instead of duplicating it.
> - Link to v1: https://patch.msgid.link/20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe

Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Thank you,
Eugene
