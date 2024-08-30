pageextension 50204 SalesOrderExt extends "Sales Order"
{
    layout
    {
        modify("Posting Date")
        {
            trigger OnAfterValidate()
            begin
                GetWeekPeriodFromGivenDate(Rec."Posting Date");
                GetMonthPeriodFromGivenDate(Rec."Posting Date");
                GetQuarterPeriodFromGivenDate(Rec."Posting Date");
                GetYearPeriodFromGivenDate(Rec."Posting Date");
            end;
        }
    }

    var
        WeekMsg: Label 'This week: %1 ~ %2\Last week: %3 ~ %4\Next week: %5 ~ %6';
        MonthMsg: Label 'This month: %1 ~ %2\Last month: %3 ~ %4\Next month: %5 ~ %6';
        QuarterMsg: Label 'This quarter: %1 ~ %2\Last quarter: %3 ~ %4\Next quarter: %5 ~ %6';
        YearMsg: Label 'This year: %1 ~ %2\Last year: %3 ~ %4\Next year: %5 ~ %6';

    local procedure GetWeekPeriodFromGivenDate(GivenDate: Date)
    var
        ThisWeekStartDate: Date;
        ThisWeekEndDate: Date;
        LastWeekStartDate: Date;
        LastWeekEndDate: Date;
        NextWeekStartDate: Date;
        NextWeekEndDate: Date;
    begin
        //This Week
        ThisWeekStartDate := CalcDate('<-CW>', GivenDate);
        ThisWeekEndDate := CalcDate('<CW>', GivenDate);

        //Last Week
        LastWeekStartDate := CalcDate('<-CW-1W>', GivenDate);
        LastWeekEndDate := CalcDate('<CW-1W>', GivenDate);

        //Next Week
        NextWeekStartDate := CalcDate('<-CW+1W>', GivenDate);
        NextWeekEndDate := CalcDate('<CW+1W>', GivenDate);

        Message(WeekMsg, ThisWeekStartDate, ThisWeekEndDate, LastWeekStartDate, LastWeekEndDate, NextWeekStartDate, NextWeekEndDate);
    end;

    local procedure GetMonthPeriodFromGivenDate(GivenDate: Date)
    var
        ThisMonthStartDate: Date;
        ThisMonthEndDate: Date;
        LastMonthStartDate: Date;
        LastMonthEndDate: Date;
        NextMonthStartDate: Date;
        NextMonthEndDate: Date;
    begin
        //This Month
        ThisMonthStartDate := CalcDate('<-CM>', GivenDate);
        ThisMonthEndDate := CalcDate('<CM>', GivenDate);

        //Last Month
        LastMonthStartDate := CalcDate('<-CM-1M>', GivenDate);
        LastMonthEndDate := CalcDate('<CM>', LastMonthStartDate);

        //Next Month
        NextMonthStartDate := CalcDate('<-CM+1M>', GivenDate);
        NextMonthEndDate := CalcDate('<CM>', NextMonthStartDate);

        Message(MonthMsg, ThisMonthStartDate, ThisMonthEndDate, LastMonthStartDate, LastMonthEndDate, NextMonthStartDate, NextMonthEndDate);
    end;

    local procedure GetQuarterPeriodFromGivenDate(GivenDate: Date)
    var
        ThisQuarterStartDate: Date;
        ThisQuarterEndDate: Date;
        LastQuarterStartDate: Date;
        LastQuarterEndDate: Date;
        NextQuarterStartDate: Date;
        NextQuarterEndDate: Date;
    begin
        //This Quarter
        ThisQuarterStartDate := CalcDate('<-CQ>', GivenDate);
        ThisQuarterEndDate := CalcDate('<CQ>', GivenDate);

        //Last Quarter
        LastQuarterStartDate := CalcDate('<-CQ-1Q>', GivenDate);
        LastQuarterEndDate := CalcDate('<CQ>', LastQuarterStartDate);

        //Next Quarter
        NextQuarterStartDate := CalcDate('<-CQ+1Q>', GivenDate);
        NextQuarterEndDate := CalcDate('<CQ>', NextQuarterStartDate);

        Message(QuarterMsg, ThisQuarterStartDate, ThisQuarterEndDate, LastQuarterStartDate, LastQuarterEndDate, NextQuarterStartDate, NextQuarterEndDate);
    end;

    local procedure GetYearPeriodFromGivenDate(GivenDate: Date)
    var
        ThisYearStartDate: Date;
        ThisYearEndDate: Date;
        LastYearStartDate: Date;
        LastYearEndDate: Date;
        NextYearStartDate: Date;
        NextYearEndDate: Date;
    begin
        //This Year
        ThisYearStartDate := CalcDate('<-CY>', GivenDate);
        ThisYearEndDate := CalcDate('<CY>', GivenDate);

        //Last Year
        LastYearStartDate := CalcDate('<-CY-1Y>', GivenDate);
        LastYearEndDate := CalcDate('<CY-1Y>', GivenDate);

        //Next Year
        NextYearStartDate := CalcDate('<-CY+1Y>', GivenDate);
        NextYearEndDate := CalcDate('<CY+1Y>', GivenDate);

        Message(YearMsg, ThisYearStartDate, ThisYearEndDate, LastYearStartDate, LastYearEndDate, NextYearStartDate, NextYearEndDate);
    end;
}
