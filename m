Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FD11E47CE
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Nov 2024 12:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731067532; cv=none; b=c+gINSDpUFy6ujzSKaTCvrOl/Do1YZCjnoAg6Tj34j1C3hzlcvqhR+ja1/vI5wYu/RdDr/yc8NYW/770/hjueXq6z1qClR/rFa35oUnastMmkMyRiIocViJj8D0zDOGIai+/nPmgJmwOcYwdYiN9W7UI97DGBT43gAcK3xPTBCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731067532; c=relaxed/simple;
	bh=LStoG6HHg7pXm4Y0GyKU8U6Wiv4QUTyRk5DhPAX9qzk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Lw41XC/1vbzCSV8Pt190pIUTEf1G1CBqYc19b+PdMYjW8kHFh0vbY+yzf3x4E75LbWt9q7ggDVEPmczGGzvUTUr5YeTVwFNAWiUimIzHShasuTTFkbfthDkuQKv0ChhAvcfV1Nj35zZwF8TQ+Qpk2Iv9lqvQ07BlDV3Fyjy0Xv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Zmxv0GUC; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Zmxv0GUC"
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 034E22FC005F;
	Fri,  8 Nov 2024 13:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1731067524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KPj8vn1if/Vd0gpEWmE0ZKUM85TxWjBw522UGaHzq78=;
	b=Zmxv0GUC+G+jq4rKLhitjY5npSrHDa/LgGLaFWzQqNhfm6//BgrmOLIJZUcsvjRUWwWRLU
	7a53Sg8wAyRU1poz//V+3zCkpbJYi95lvG0gY4LZT4g85dJJ15tXgpiW+O5N3TgXVc7vR/
	5UqdzcvD9VZ75A8fo0W5COXybPMejcM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <172b7acd-4313-4924-bcbc-41b73b39ada0@tuxedocomputers.com>
Date: Fri, 8 Nov 2024 13:05:23 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, linux-hwmon@vger.kernel.org
Cc: Armin Wolf <W_Armin@gmx.de>, Juno Computers USA <usa@junocomputers.com>
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: CPU/GPU fan control with safety via hwmon
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi everyone,

I'm currently conceptualizing an upstream implementation for the fan control on 
our Sirius 16 Gen 1 & 2 devices which has the following custom WMI functions 
(pseudo code):

void SMOD(bool mode): Toggle firmware controlled fans vs manually (aka via the 
commands below) controlled fans
bool GMOD(): Get current SMOD setting
int GCNT(): Get number of fans
enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
void SSPD(int index, int value): Set fan speed target as a fraction of max speed
int GSPD(int index): Get current fan speed target as a fraction of max speed
int GRPM(int index): Get current actual fan speed in revolutions per minute
int GTMP(int index): Get temperature of thing fan with respective index is 
pointed at (CPU or GPU die, see GTYP)

However there are some physical limitations that are not in the firmware and I 
would like to implement as low as possible in software, aka the driver, to avoid 
hardware damage:

1. Valid fan speeds are 0% (fan off) and 25-100%. Values from 1%-24% must not be 
written.

2. As long as GTMP is > 80°C fan speed must be at least 30%.

We would love to see the same driver enforced restrictions in the Uniwil driver 
Armin is working on and the Clevo driver Juno Computers is working on.

My Idea so far:

1. Round SSPD input: 0-12% -> 0%, 13-25% -> 25%

2. Periodically check GTMP (every second should be enough) in driver and if the 
temperature is over 80°C set current and incoming speed commands to at at least 30%.

Is this legitimate with the hwmon design?

Second question: Is there a good way to implement a userspace controlled switch 
between auto and manual mode?

Kind regards,

Werner Sembach

