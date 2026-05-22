Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4573723E33D;
	Fri, 22 May 2026 01:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779413623; cv=none; b=J8xF2PJWwJssYfi3Fh72qlvRX7cu2v/YrnxxyTvrZU/MWyaCZUCB0NOvjlZ7Aa30frcQeJg3WzF53DhAFx2ILuKw1xsA7BDt1EPtqxm/bmuuo1+0pd/RprUqYPRe4q5Va7pdjYjLEWBsoC7m7fSlQXE2ajo7XSlud8NT6Nh/YHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779413623; c=relaxed/simple;
	bh=PSB695HQWTO5tHe9RLrLUjaTcqht9lOXxmIuVaUvP30=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ThVJ1OOV+K90Yg6vMsGK/RxG3H3e2erv5Qm/g3ZMo2rThJ4aDsqS3breKu1Grm48MU0sDX1OwaBcv4++JM4qAUe4uaNBRJt/pIPTAGqV0ro9M18LU+UsfimMg355RsvoxgLWXJKqQwzZoJ20Q6lpYSVyCYgqCUT6XAW0Lega0uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=j5wJFj1B; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="j5wJFj1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=PSB695HQWTO5tHe9RLrLUjaTcqht9lOXxmIuVaUvP30=; b=j
	5wJFj1BdbN8Zpg1mdgnxNNdqDsIT8b+k+7JXBGT3MVf8OVOapds/Ga2I5VoNMYry
	G1J0XKnHgp6aEo7fUCVOB8eZRB6bZ4AXa3KVSqrsD+VWsWC2B5zepJSmnwMBq3eu
	t2C47KIA2qU0dPXNK481WU+883WlfGK+cAaJhA5s54=
Received: from rh_king$163.com ( [103.30.235.251] ) by
 ajax-webmail-wmsvr-40-112 (Coremail) ; Fri, 22 May 2026 09:33:17 +0800
 (CST)
Date: Fri, 22 May 2026 09:33:17 +0800 (CST)
From: =?GBK?B?yM66oyA=?= <rh_king@163.com>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re:Re: [PATCH v3 2/2] hwmon: (lenovo-ec-sensors): Fix EC "MCHP"
 signature validation logic
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <f12705e0-2e91-49db-aead-d29d92141511@roeck-us.net>
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260521035228.533317-1-rh_king@163.com>
 <20260521035228.533317-3-rh_king@163.com>
 <f12705e0-2e91-49db-aead-d29d92141511@roeck-us.net>
X-NTES-SC: AL_Qu2cC/iavE0i4SGbZukcnk0Whuw5Xse2uPQh24JSc/gEugnM9iEnc1h9GlrI/9K2Ihujtye1dhRE5/RLUYt31TWpu8IPx3G8ZkTTGbJ4Ag==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <3e5294b9.12cd.19e4d50bbd9.Coremail.rh_king@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cCgvCgD3H0Jdsg9qCv2oAA--.7749W
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC3x0i0GoPsl0omwAA3J
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIaSBHdWVudGVyLApUaGFua3MgZm9yIHlvdXIgcGF0aWVudCByZXZpZXcgYW5kIGFwcHJvdmFs
LgpLZWFuCgoKCgoKCgoKCgoKCgpBdCAyMDI2LTA1LTIxIDIxOjQ2OjAwLCAiR3VlbnRlciBSb2Vj
ayIgPGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6Cj5PbiBUaHUsIE1heSAyMSwgMjAyNiBhdCAx
MTo1MjoyOEFNICswODAwLCBLZWFuIFJlbiB3cm90ZToKPj4gVGhlIEVDIHNpZ25hdHVyZSBjaGVj
ayB1c2VzICYmIGluc3RlYWQgb2YgfHwgYmV0d2VlbiB0aGUgZm91cgo+PiBieXRlIGNvbXBhcmlz
b25zLiAgV2l0aCAmJiwgdGhlIGNvbmRpdGlvbiBpcyB0cnVlIG9ubHkgd2hlbiBBTEwKPj4gZm91
ciBieXRlcyBmYWlsIHRvIG1hdGNoIHNpbXVsdGFuZW91c2x5LCBtZWFuaW5nIHRoZSBkcml2ZXIK
Pj4gYWNjZXB0cyBhIGRldmljZSBhcyBhIHZhbGlkIE1pY3JvY2hpcCBFQyBpZiBBTlkgc2luZ2xl
IGJ5dGUgb2YKPj4gdGhlIDQtYnl0ZSAiTUNIUCIgc2lnbmF0dXJlIGhhcHBlbnMgdG8gbWF0Y2gu
Cj4+IAo+PiBEdWUgdG8gc2hvcnQtY2lyY3VpdCBldmFsdWF0aW9uLCBpZiB0aGUgZmlyc3QgYnl0
ZSByZWFkcyBiYWNrIGFzCj4+ICdNJyAoMHg0RCwgYSB2ZXJ5IGNvbW1vbiByZWdpc3RlciB2YWx1
ZSksIHRoZSByZW1haW5pbmcgdGhyZWUKPj4gY29tcGFyaXNvbnMgYXJlIHNraXBwZWQgZW50aXJl
bHkgYW5kIHRoZSBkZXZpY2UgaXMgYWNjZXB0ZWQuCj4+IAo+PiBDaGFuZ2UgJiYgdG8gfHwgc28g
dGhlIGNoZWNrIHJlamVjdHMgZGV2aWNlcyB0aGF0IGRvIG5vdCBmdWxseQo+PiBtYXRjaCB0aGUg
ZXhwZWN0ZWQgRUMgc2lnbmF0dXJlLCBhcyBvcmlnaW5hbGx5IGludGVuZGVkLgo+PiAKPj4gUmV2
aWV3ZWQtYnk6IE1hcmsgUGVhcnNvbiA8bXBlYXJzb24tbGVub3ZvQHNxdWViYi5jYT4KPj4gU2ln
bmVkLW9mZi1ieTogS2VhbiBSZW4gPHJoX2tpbmdAMTYzLmNvbT4KPgo+QXBwbGllZC4KPgo+VGhh
bmtzLAo+R3VlbnRlcgo=
