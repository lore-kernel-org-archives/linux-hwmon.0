Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F6A231827
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2026 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782636870; cv=pass; b=d6Jf+rs5P7zzzJWBZzA6/r9TY6MxOdnItGjJqApbUBGiBHeSlg++v4/dYMAevpRIH6ZdVVA9QOf4btGNrDK6sRH8Wv+/VhCgXtnQmIDojA0iQur0uiB/kX30+RUedA+aoNF9ien4ZfnQz12FYnqEhOH14oUBhs2rTJR1EECJf0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782636870; c=relaxed/simple;
	bh=kDRw7b6eryh8adlChih1K4e/44/BuDXe2dwWDJBGDU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CK1tklQ0xkJaEVXCCe9xy4V63eeDHssx0Hu/WU3ZMYCthcmz8DSr3SOqvdb2i99I+5A0jD1l3s+dPlgnypKNV+pyzkdxtj5HAPl1dmTn5gWI9ehVuCJ06bZuxdNgI2LmgfkRDqF6Rql27viRveBSZD9XXlt9WUzkBCvs2Q/X/Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dn930Hub; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dn930Hub"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-845ea8924a2so161824b3a.1
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2026 01:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782636869; cv=none;
        d=google.com; s=arc-20260327;
        b=riDWJJupS8G59zQ8sVMnR1eUk2xqN3TBdcFYg5UG6HXWuQ1YC3ylzmTW2c9/0Buhw8
         8ast4BJ1rbgor3S5zJEVB/lbQBrocUpAqqaUaQ7kNU/W7nP5hTmsVTtdB0jebBf2klcp
         I5BEjCSKA0/HJ9jSboCQAIndSn/ObnKaKCAiF5wb+yfatz+0/WZ9rmZPeQFsCp1RlL1R
         DjYCwSxa9wXCXZPomnczaSF9Eobu3dEZ1sSyOAR30RkjqeLUIoptFxRNPekbtM7aXUWb
         VHypIE81yFLsOBeuJ58ns13v7VsI3BxyzwI/JdLkQgylW1eHmYW0TjvhNHUDb8dn1pqM
         fR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kDRw7b6eryh8adlChih1K4e/44/BuDXe2dwWDJBGDU4=;
        fh=2EDuiq0OlEPVOLrR6Tnwe6T4lTB9G+GKTEK9GoAZaDA=;
        b=f5uXuauZViNXNxU7bYIm9A4VR6sf7rytSIo45E2eB2KgiWNzEJs8m7skIgY58Cz/rq
         QT1hsm+RphdiCX9mmuP4M1CO/szI969tU14vI7Ji03wbIKqe6DT+9zIx5Yq3HJA7c5S8
         nEWDN1zv65UVqEvCLOvVC5ghjnl2h3yLZYJ0tA4GldV9TH0nNs9FLV6KhGlmvfyjuO/K
         VQfoHzBgKC/tArbsYOvIc+HqUFuDjqbW+5PIPHK3fjhMkbiMG0d1N0YeIsPTmgKnHQdx
         2mZ8CbYUhWAabb9yZ7AFDliYDzo42ToBoRz2A4pU/k9Y4VQ2zn6whygZpxlCB5nKcNyi
         muxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782636869; x=1783241669; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kDRw7b6eryh8adlChih1K4e/44/BuDXe2dwWDJBGDU4=;
        b=Dn930HubjkxrWQwUcxisnPvgSLatNv/cZX0+Nxi49sdoxq4IPXaFBqF9BLCWSUXhSa
         jb4g4hMDsw+lsgjxUQj0TSr6ItNFrq0mzTl/Gs5H3J22+qNTc72F0uEsIkJ/DE8Gn5Zi
         UuV6/2luQU3qdUS+gU0H3RcBYf6HswdDP1cJSvZfeZvMoYBhAgaxPaof5/u2tV0ufjqn
         2rP5JYAhP0A0JGWtSgc81EAzDGT27Tzv5GLb7iL7lS1LV6Y3xpjy8kuWHKse1+kOjc/n
         rP6eN/fPBAY1kmlt7BcioZUKDKIq7Omu5rStE6Xo7c7bN9V9OkC0JleUdQ5/mQfafzyB
         cMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782636869; x=1783241669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDRw7b6eryh8adlChih1K4e/44/BuDXe2dwWDJBGDU4=;
        b=DyRVxYAMiPlq/wjsg8W3Aj4uYjLzyiJBsJkdJDzRJZmh4Y1IUMQyK0qu8cwedq593K
         fUCNLQKzOTAVg72CJ5q40jglCNOVyPVGIvgBOUWiapwgo6N3qv9dfrouFnBVUetX6J+n
         eZdIIC08nD8i7PN1B+qvrdtw+K43wtE+MNcWYZBCNY/VmDH48dG+327tp41VAYqcCS3k
         TMsaPC1OL4pyKkVoTMCixT1t/19jH8pQE4vJJG4QfIvGSSslrWFIHAgZg3eOuF+emCJi
         DYUpqfgTowkDRt+UB+4sPhRBhpkTY0Vz6IuHAmTsB4NE29Z7uzGRoM8jdtXeeZ4BtN4r
         VLyg==
X-Gm-Message-State: AOJu0Ywo6kHfKvMAWPR79ogWM0p7EMxIIizymICUF7Kg8ZiQH3lVTI6G
	DHwyC6CLqsadxLKIeATGo5UUstvhCvzcYGex1dsFBCJKqGpbe3TCcOJf/US8fmbsWLBaGK2Rmst
	9aE4sFqL7sn8akfmoWkJWkEQlW0GVboo=
X-Gm-Gg: AfdE7clGqFzC7eXe8/4QlfxPeeBuC54MHzL7u3HpFGaZ7EFSJSgJPL5BrVWo9gjAm1b
	iWUrngjT8mSRiFG45pqZvtURUu3WY5DlE1ATqprh1NkwFppYobJITwDs6lKHjFsnt1OBNO6tD6u
	LmcmLWblFQJdsoFqSOHq3E8n79ARnc6SdOEE7oj6pukl7zr9/664EHhIdaOTl+hmgKwAkOpq56i
	4UC9WY06P2BkWYdUIdY542+3SId0VTZQ9aG/gKXRgHBIS4Fx4GuJGdmU7Z7J4XA84sUAOshQWk=
X-Received: by 2002:a05:6a20:ef01:b0:3bf:6c05:ac with SMTP id
 adf61e73a8af0-3bf6c0549cemr5398370637.59.1782636868773; Sun, 28 Jun 2026
 01:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <trinity-1da5540c-e8bb-4481-aa98-829f4cc27b43-1782556154552@trinity-msg-rest-gmx-gmx-live-6674dcf44b-psb5m>
In-Reply-To: <trinity-1da5540c-e8bb-4481-aa98-829f4cc27b43-1782556154552@trinity-msg-rest-gmx-gmx-live-6674dcf44b-psb5m>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sun, 28 Jun 2026 10:54:16 +0200
X-Gm-Features: AVVi8Ce_RG7SZ0bWhg0zYhYO5k8k-zHLCktHDXvjNy2eediwb1Kp8_hays2A3FI
Message-ID: <CAB95QARP4oY8k_A3TS7noFFDmEk7JJbiPSD1kNDV5F1ARsRYog@mail.gmail.com>
Subject: Re: Water Temp T_Sensor z690 Pro Art
To: Maurice Jean Mehlhaff <maurice.mehlhaff@gmx.de>
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maurice Jean,

On Sat, 27 Jun 2026 at 12:29, Maurice Jean Mehlhaff
<maurice.mehlhaff@gmx.de> wrote:
> I own an ASUS ProArt Z690-CREATOR WIFI motherboard and noticed that it is currently not supported by the asus_ec_sensors driver.

for a quick local test you can simly change the DMI board name for the
existing z690 formula in:

DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z690 FORMULA",
&board_info_maximus_z690_formula),

Replacing "ROG MAXIMUS Z690 FORMULA" with "ProArt Z690-CREATOR WIFI"
(name from dmidecode) will make the driver use the
board_info_maximus_z690_formula struct for your model. Or you
duplicate that struct under a suitable name (like
board_proart_z690_creator_wifi), clean up the sensor (ProArt provides
no water cooling support):

static const struct ec_board_info board_proart_z690_creator_wifi = {
.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM,
.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
.family = family_intel_600_series,
};

and add another DMI record:
DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt Z690-CREATOR WIFI"",
&board_proart_z690_creator_wifi),

If that works and you want to submit a patch, please also share DSDT
dump, which allows to check if .mutex_path is correct.

Cheers,
Eugene
