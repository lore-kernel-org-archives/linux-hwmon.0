Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35774 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751316AbeCIXlO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Mar 2018 18:41:14 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w29NcppB074998
        for <linux-hwmon@vger.kernel.org>; Fri, 9 Mar 2018 18:41:13 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com [158.85.210.109])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gm25gkb0t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Mar 2018 18:41:13 -0500
Received: from localhost
        by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
        for <linux-hwmon@vger.kernel.org> from <miltonm@us.ibm.com>;
        Fri, 9 Mar 2018 23:41:12 -0000
In-Reply-To: <20180307221124.GD10438@amd>
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a document
 of PECI adapter driver for Aspeed AST24xx/25xx SoCs
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        linux-hwmon@vger.kernel.org, andrew@lunn.ch, jdelvare@suse.com,
        arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au,
        gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Date: Fri, 9 Mar 2018 23:41:00 +0000
MIME-Version: 1.0
References: <20180307221124.GD10438@amd>,<20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
 <20180306124002.GA13950@amd>
 <33bf6563-b220-7ff9-8b04-84e9bd781b3f@linux.intel.com>
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset=UTF-8
Message-Id: <OF08D8261E.8F72E5DC-ON0025824B.008218BB-0025824B.008218C6@notes.na.collabserv.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

About  03/07/2018 04:12PM in some time zone, Pavel Machek wrote:
>Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings:
>Add a document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
>
>Hi!
>
>> >Are these SoCs x86-based?
>> 
>> Yes, these are ARM SoCs. Please see Andrew's answer as well.
>
>Understood, thanks.
>
>> >>+	Read sampling point selection. The whole period of a bit time
>will be
>> >>+	divided into 16 time frames. This value will determine which
>time frame
>> >>+	this controller will sample PECI signal for data read back.
>Usually in
>> >>+	the middle of a bit time is the best.
>> >
>> >English? "This value will determine when this controller"?
>> >
>> 
>> Could I change it like below?:
>> 
>> "This value will determine in which time frame this controller
>samples PECI
>> signal for data read back"
>
>I guess... I'm not native speaker, I guess this could be improved
>some
>more.
>

I agree this wording is still confusing. 

The problem is that the key subject, the time of the sampling, is in the descriptive clause "in which time frame".

"This value will determine the time frame in which the controller will sample"

or perhaps phrase it as saving a specific sample from the over-clock, or a phase of the clock.

>Best regards,
>									Pavel
>
>-- 
>(english) http://www.livejournal.com/~pavelmachek
>(cesky, pictures)
>http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
>

milton
--
Speaking for myself not IBM.

