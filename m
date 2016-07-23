Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:36626 "EHLO
	mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882AbcGWNgk (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 23 Jul 2016 09:36:40 -0400
MIME-Version: 1.0
From: Pratik Prajapati <pratik.prajapati12@gmail.com>
Date: Sat, 23 Jul 2016 19:06:39 +0530
Message-ID: <CAHNg1Spjoao_fndWBP7mzE=ORMGK=vSUsVmN+EPvwv912-0KqA@mail.gmail.com>
Subject: How to support multiple chips in single driver
To: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

I want to add the threshold, event handling and interrupts support in
vcnl4000 driver but those functionalities are not supported in
vcnl4000, but supported in vcnl4010 .

Do we have an example (IIO driver) of supporting multiple chips in a
single driver?

Note* - vcnl4010 is superset of vcnl4000

Best Regards,
Pratik Prajapati
