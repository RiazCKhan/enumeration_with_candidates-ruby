# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.detect do | candidate | 
    if candidate[:id] == id
      return candidate end
    end
end

def experienced?(candidate)
  # candidate.each do | person |
  if candidate[:years_of_experience] >= 2
    return true
  else
    return false end
end

def github_points?(candidate)
  # @candidates.each do | candidate |
  if candidate[:github_points] >= 100
    return true
  else
    return false end
end

def program_language?(candidate)
  # @candidates.each do | candidate |
  if candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
     return true
  else
    return false end
end

def date_applied?(candidate)
  # @candidates.each do | candidate |
  if candidate[:date_applied] > 15.day.ago.to_date
    return true
  else
    return false end
end

def age?(candidate)
  if candidate[:age] > 17
    return true
  else
    return false end
end

def qualified_candidates(candidates)
  candidates.filter { | candidate | experienced?(candidate) }
    .filter { | candidate | github_points?(candidate) }
    .filter { | candidate |  program_language?(candidate) }
    .filter { | candidate | date_applied?(candidate) }
    .filter { | candidate | age?(candidate) }
end

def ordered_by_qualifications(candidates)
  candidates.sort { | a, b | b[:github_points] <=> a[:github_points] }
    .sort_by { | years | -years[:years_of_experience] }
end


