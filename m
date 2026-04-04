Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA3350298
	for <linux-hwmon@vger.kernel.org>; Sat,  4 Apr 2026 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775286789; cv=pass; b=DlXR1Dh/6Q41iUsfhUT0fsaJIi5itrG3OlS3iSMy4jZY8TZtvgU3G3hwS5jayPxhd7ugWR07G7BIJ9SZCZWCxVenRqkD6EYb9VChrxwHzOxsWpsCMHiRfxTs5LjgN1BFZlyaPzbHgD2hYc2j7fx37BJdYviMjqUhckC1OvuZlZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775286789; c=relaxed/simple;
	bh=tr/A5qDD+FzW1NnPRm/+rMKfhCDuEnKfAXwXnOifZpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPJeP/jMl0IO4mJCvGi3W8bIHjyJhGhD/1MHHMWx52atGHpMqrpvo/bYsuvTYR9myO8azeUckml7ynE8MrmYT/1u5OvPCWjPzTf0KdvDskZdzJzKAwz1cCtu8guF4+sfUkQ+qP3Yb4EYjuXFHJKWIA3vlMISuFSXrHfM7Or8YI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRYEruK8; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRYEruK8"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c76bde70ec9so940358a12.2
        for <linux-hwmon@vger.kernel.org>; Sat, 04 Apr 2026 00:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775286787; cv=none;
        d=google.com; s=arc-20240605;
        b=grQ392NQmC1DKylzvG8GKmN0HIW65J9j3blzYAg/vyAGM8uOxCdrNCekif6hGLIQNd
         1CJfz4D7KyQuqu5d6z7wsEbfQrQK7daAkPHHqXUxt+nUry/fnRJJkSmqkEFw3n3niuXj
         AiX64KyYH7j2d1Ud8iywNJdY5fzm3XwmCW4+X09gGks6rtKsKrrYPNcccTC++ak1df/u
         hADlk+fEfLdNG6qGMRjf7pvs5fct2gOvuVZhVrfv5IGC2HYXlKUltxFj9MnhGiEgzRi+
         HDSQdTXqiRLwMGGW+0eg+j2OP+cvKRdB/O+9kVv+Wgnjk4pQrPvmOVvrQjIEjbm8E5sW
         hx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tr/A5qDD+FzW1NnPRm/+rMKfhCDuEnKfAXwXnOifZpo=;
        fh=b/5fBuaRhOVJNhqdtenPus5W53b4MUg/vWhp/f3PwA0=;
        b=i0oBiZDTIvWJhv1unq8J5y4bEB760rmPV0FUztzATVVvellNKUxJa+oFixpnYL5Qah
         DRxa7lcBli7l5CEoJKB+bDxMUmwqYoHf5wZW54oRywitGdqsK58hRyzlxCwwARsnPdS5
         evYDWMIBACRcy419sMdA+pmwNTyx5wubu//W/PKPATES9uBRZ6wAlr64fQNj38+O/gL0
         MaMn0O8OGrmSnfB9gTv+OJaklDVkacXoKBxHUAl0d0jQZOM4Xc2BVig4nRnxA/28LHE4
         m7KBM8vHi3ca04+iwRNv4KJ4l+cC9zjT7J+O+rh8ewU1357kV85uqSPsuAuyWI2b4QcW
         VfCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775286787; x=1775891587; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tr/A5qDD+FzW1NnPRm/+rMKfhCDuEnKfAXwXnOifZpo=;
        b=RRYEruK80Mn9UPdtb6fLobaLtc7P6xudOldijCLt9ypGQ/toF01tHKnM8YPrLvYjbr
         LJe8/Lca05vEfcOon+pGEaEM/RxBnOBVc9fkIksJExuJ0GuAJQze/68FKvhiCTosujB9
         Eo9rKZo5puvE35pVC9ij32mpqPb/lZSaOWCHTVs+iNzPfa3o6AiOvlBDcn+LvTuZspKq
         UlyI0cNfwY0h21OktprQqQVHBaoDquBQcM0UjFA3Wk97mABRhS/fCVT0iAt5amElgkD8
         yqEtOZUrBEkNxm7NA1L73QXDnACCa6GTWt0d/3lsE0Y8FeCkfExE3Wwe6mka8k+7BLju
         se4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775286787; x=1775891587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tr/A5qDD+FzW1NnPRm/+rMKfhCDuEnKfAXwXnOifZpo=;
        b=UlqMAyBJ1+Rl35l9cEjmZnGWJyrb8eRmAmQ8Ab9fpIk4Q7FJpI73DZOCLCzfCFwu9q
         cTTQfZrTHsp08Ptti7+ZsUx8vzPt3WUF/MKkVLx2lmiQ9OlwX6qBFU5vQi3O6DxN3IdV
         Jta0JbIHg5bghdBH9CxaZehefMKE8gY8H7iE6fhDdXz4/fA/alxyQCwgmScRCZCrqBK7
         avNi62Gqp0rxiPZSMEMaWA0YtJfB8PWnYJJD1jihHEIZRLLx1JGHWtqb2eW9drO2m8AO
         9J309u9dVYFHBl+R08XXInnmGdOdpPZlmiQmVVDP3/l59yMM+Sn5C2bJRHZyMz663alx
         PsHg==
X-Forwarded-Encrypted: i=1; AJvYcCW2ABfezOxsj8XT/BI3fPAFiu7t2Gkcb/3iQb9vdCFgXiLVwCjEUtM0SBGUlybLzZkAB2BFoLdIgF4zqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhsY2U3uOTTfjM/ondwG+Mn7hWarSOYIYHr1Sdmauz5CqwGIy1
	mS2jmI97gGQgfrmrH7ADPzZGte4W6jygeJJjwvpYbjywGuxWYZdR7uwsCyB4JJ8KOvQ56rbt/oA
	zlmva+E2oDhy2eocLhC55GbbpgsJTALY=
X-Gm-Gg: AeBDieuTX+oyH4XRrzkrbOUT4BkSe97+DfhjNGE2LqHbwAqj5N2rsW7CPEfOsE6Y/lf
	VubPGGCtXByMsPLP58mZoBjI24oc664vigTkpBMC20PNh7pWjjBFD5fJXtc4xKvFFHAfzSKDPdB
	wSYMNYEuB7wsij9eot+xt2gQ8uAW0L9Ze+YGu18qhx8qbj+yiWg7ewtUTOjsIrEKkHLxrD3Jhc5
	M7Ak39xEZATbQoNwd+j/Vmope/krm2HLJQzRtp9N35Ah7D1Rl17TDoN1zWmGbgvwYAT50kb/cun
	x6YD+/aR7f60y/+zHNuE1s9KTq3IIUSrHhBgLpSK
X-Received: by 2002:a17:903:1b2e:b0:2b0:70c8:ccea with SMTP id
 d9443c01a7336-2b2816a64b9mr56570735ad.13.1775286787272; Sat, 04 Apr 2026
 00:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403210343.1380437-1-eugene.shalygin@gmail.com> <05e9870a-5d8c-410d-99ed-6ef9470b2ff7@roeck-us.net>
In-Reply-To: <05e9870a-5d8c-410d-99ed-6ef9470b2ff7@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sat, 4 Apr 2026 09:12:55 +0200
X-Gm-Features: AQROBzCHZ35tCtoDo8m50DlgqUT0ZTlGMZCktkN4oemYuJIdiiyVf3JJGbg2n5o
Message-ID: <CAB95QATxrJa0koMq=BCjnXvLHJ5boRBUA+76FwqWJhmhEi-Tqg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING WIFI
To: Guenter Roeck <linux@roeck-us.net>
Cc: Veronika Kossmann <nanodesuu@gmail.com>, Veronika Kossmann <desu.git@rxtx.cx>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Apr 2026 at 06:38, Guenter Roeck <linux@roeck-us.net> wrote:
> Sashiko has a problem with this patch:

I must admit now, that these _SET macros were a bad idea, it turned
out to be too easy to misread. I'm going to remove them.

Veronika, could you, please, show us the output from sensors with this
version of the code?

Cheers,
Eugene
